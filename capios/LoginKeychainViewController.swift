//
//  LoginKeychainViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 31/05/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import Valet
// Ref: https://github.com/square/Valet

/*Valet é uma lib construída para tratar de uma maneira mais simplificada com o Keychain do sistema operacional, qualquer que seja, tvOS, watchOS, iOS, macOS...
 É uma lib Thread Safe, ou seja, pode ser usada em qualquer fila ou thread.
 
 No entanto, como o Keychain é efetivamente armazenado no disco, não há garantia que a sua leitura e escrita de itens, realizadas na thread principal, não causaram pequenos travamentos ou corte nas animações. Então é recomendado que todas utilização de um valet, seja feita em segundo plano, em uma outra thread.
 
 Atenção: Tome cuidado para não corromper dados ao ler e escrever em múltiplas threads simultaneamente
 */

class LoginKeychainViewController: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    /*
     Antes de usar o Valet para acessar o Keychain, primeiro você precisar criar uma instância dele.
     
     Inicialização do valet, informando um identificar único para ele e qual o nível de acessibilidade que o Valet terá. O Valet tem um Enum para definir o nível de acessibilidade (Accessibility), nesse caso, nossa aplicação terá acesso ao Keychain apenas quando o device estiver desbloqueado
     
     Com essas configurações, a instância 'valet', pode ser usado para armazenar e recuperar dados seguramente nesse device, mas apenas quando o device estiver com a tela desbloqueada
     */
    let valet: Valet = Valet.valet(with: Identifier(nonEmpty: "ValetUniqueId")!,
                                   accessibility: .whenUnlocked)
    
    /*
    Você também tem a opção de criar um valet que gerencie a segurança com o uso de biometria. Dessa forma, sempre que você desejar acessar um valor que esteja salvo no Valet, será solicitado ao usuário que confirme a presença com o uso da biometria (faceId, TouchId ou usando o passCode do device).
    Usar o SecureEnclaveValet é a forma mais segura de armazenar dados no iOS, tvOS, watchOS e macOS.
    Atenção: O SecureEnclaveValet não pode ser usado em devices que não suportem Secure Enclave. Nesse caso você deverá usar o Valet padrão.
    Não esqueça de adicionar ao info.plist a requisição de autorização para uso da biometria: Privacy - Face ID Usage Description (NSFaceIDUsageDescription), ou touchId...
    ATENÇÃO! SecureEnclaveValet não funciona para simulador, apenas devices.
    Para controle de acesso Biométrico, você também pode usar o SinglePromptSecureEnclaveValet, que terá o mesmo comportamento que o SecureEnclaveValet, mas ao invés de chamar a confirmação biométrica a cada request, irá chamar apenas na primeira vez que um dado do Keychain for solicitado.
    Ahh mas daí só vai chamar uma vez e nunca mais?! Isso mesmo, mas você pode forçar para que seja solicitada a confirmação biométrica, caso ache necessário chamar mais uma vez. Para isso, basta chamar o método requirePromptOnNextAccess(). Ex: valet.requirePromptOnNextAccess()
    
     Nesse exemplo, nós usaremos o SinglePromptSecureEnclaveValet, pq com base no que nós iremos fazer, esse é o que traz uma melhor experiência para o usuário.
     */
    let valetWithBiometrics: SinglePromptSecureEnclaveValet = SinglePromptSecureEnclaveValet.valet(with: Identifier(nonEmpty: "ValetUniqueId")!, accessControl: .biometricAny)
    /*
     Escolhendo o melhor Identifier:
     O identifier escolhido para seu Valet, irá criar um 'sandbox' para os dados que seu Valet irá salvar no Keychain. Por exemplo:
     Dois Valets criados com o mesmo identifier, estarão disponíveis para ler e escrever as mesmas chaves e valores no Keychain. Valets criados com identifiers diferentes, terão suas próprias 'sandbox' e conseguirão acessar, apenas as próprias 'sandbox', ou seja, o Valet-A não terá acesso as chaves e valores do Valet-B.
     
     Escolhendo o melhor valor de Acessibilidade:
     Esse enum é usado para determinar quando seus 'segredos' poderão ser acessados. É uma boa ideia usar a acessibilidade mais restrita possível, que permita seu app continuar funcionando. Por exemplo, se seu app não rodar em segundo plano, é uma boa prática garantir que seus dados secretos, só possam ser acessados quando o celular estiver desbloqueado.
     */
    
    /*
     iCloudValet:
     Você também pode compartilhar informações do Keychain, com outros devices que tenham a mesma conta do iCloud, usando o construtor: Valet.iCloudValet(with: Identifier(nonEmpty: "ValetUniqueId")!, accessibility: .whenUnlocked)
     */
    
    //sharedAccessGroupValet:
    //NOTA: O construtor abaixo serve para armazenar dados que devam ser compartilhados por outro app do mesmo desenvolvedor, ou equipe de desenvolvimento. Está comentado, pois só funciona em um ambiente real, fora do debugger.
    //let valetForSharingBetweenApps: Valet = Valet.sharedAccessGroupValet(with: Identifier(nonEmpty: "ValetUniqueId")!, accessibility: .whenUnlocked)
    override func viewDidLoad() {
        super.viewDidLoad()
        //Aqui é verificado se o device tem acesso ao KeyChain. Para saber quais as condições que o app retornará false no método, canAccessKeychain, olhe no fim dessa classe.
        if !valet.canAccessKeychain() {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func checkEnclaveSecurity() -> Bool {
        /*
         Aqui nós temos a implementação do SecureEnclave, que solicita um touchId/FaceId, para todas as vezes que você desejar acessar um campo salvo no Keychain.
         
         É interessante testar fazer essa chamada substituindo o SinglePromptSecureEnclaveValet, pelo SecureEnclaveValet, para você ver como ele não traz uma experiência boa para o usuário, já que em um único request ele pede 3 vezes para o usuário realizar o touchId.
         */
        
        if !valetWithBiometrics.canAccessKeychain() {
            //Tem Secure Enclave disponível
            return false
        }
        if valetWithBiometrics.containsObject(forKey: "username") &&
            valetWithBiometrics.containsObject(forKey: "password") &&
            valetWithBiometrics.containsObject(forKey: "User") {
            textView.text += "Dados recuperados com TouchID/FaceID:\n\n"
            
            /*
             Ao chamar a chave username através do Security Enclave, o retorno não é uma string, mas sim um SecureEnclave.Result<String>. Nesse SecureEnclave.Result<String>, é retornado um estado: success, userCancelled, itemNotFound. Para ter acesso a informação, você vai precisar realizar um switch, do resultado da chamada e adicionar um atributo let para o case 'success', que trará para você o valor que está armazenado na chave requerida.
             */
            switch valetWithBiometrics.string(forKey: "username", withPrompt: "Use seu Touch ID apple para acessar os dados") {
            case let .success(username):
                textView.text += "username: \(username)\n"
                
            case .userCancelled:
                textView.text += "usuário cancelou o acesso ao username"
                
            case .itemNotFound:
                textView.text += "campo username não encontrado"
            }
            
            switch valetWithBiometrics.string(forKey: "password", withPrompt: "Use seu Touch ID apple para acessar os dados") {
            case let .success(password):
                textView.text += "password: \(password)\n"
                
            case .userCancelled:
                textView.text += "usuário cancelou o acesso ao password"
                
            case .itemNotFound:
                textView.text += "campo password não encontrado"
            }
            
            switch valetWithBiometrics.object(forKey: "User", withPrompt: "use seu Touch ID para acessar seu usuários") {
            case let .success(user):
                textView.text += "User: \(User.retriveUser(data: user))\n"
                
            case .userCancelled:
                textView.text += "usuário cancelou o acesso ao password"
                
            case .itemNotFound:
                textView.text += "campo password não encontrado"
            }
            return true
        }
        
        return false
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        view.endEditing(true)
        textView.text = ""
        
        if !self.checkIfFieldsAreValid() {
            let alert = UIAlertController(title: "Ops", message: "Insira um username/password para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        self.readAndWriteDataWithValet(usernameTxtField.text!,
                                       password: passwordTxtField.text!)
    }
    
    func checkIfFieldsAreValid() -> Bool {
        //Os campo existem?
        guard let username = usernameTxtField.text,
            let password = passwordTxtField.text else { return false }
        
        /*
         Os campos são válidos?
         Lembre-se, não é possível armazenar campos sem valor preenchido. Se você tentar fazer isso, seu app irá travar/crash
         */
        if username.isEmpty || password.isEmpty {
            return false
        }
        
        return true
    }
    
    func readAndWriteDataWithValet(_ username: String, password: String) {
        //Aqui temos o Valet salvando os dados em formato de 'String'
        textView.text = "Armazenando dados em formato string:\n"
        valet.set(string: username, forKey: "username")
        valet.set(string: password, forKey: "password")
        
        textView.text += "username salvo: \(username)\n"
        textView.text += "password salvo: \(password)\n\n"
        
        textView.text += "Recuperando as informações armazenadas no Valet:\n"
        if let _username = valet.string(forKey: "username") {
            textView.text += "username: \(_username)\n"
        }
        if let _password = valet.string(forKey: "password") {
            textView.text += "password: \(_password)\n\n"
        }
        
        //Mas também é possível armazenar dados em formato 'Data'.
        textView.text += "Armazenando objeto User:\n"
        var user = User(username: username, password: password)
        valet.set(object: user.retrieveData(), forKey: "User")
        textView.text += "usuário salvo como Data: \nTamanho: \(user.retrieveData())\nDados: \(user.retrieveData().base64EncodedString()) \n"
        
        //Recuperando as informações salvas do objeto no Valet
        if let valetData = valet.object(forKey: "User") {
            let otherUserInstance = User.retriveUser(data: valetData)
            textView.text += "User recuperado do valet e convertido em User novamente: \(otherUserInstance)"
        }
        
        //Nós também devemos salvar as informações no SinglePromptSecureEnclaveValet, afinal de contas, ele usa uma sandBox diferente, por ter um outro construtor.
        valetWithBiometrics.set(string: username, forKey: "username")
        valetWithBiometrics.set(string: password, forKey: "password")
        valetWithBiometrics.set(object: user.retrieveData(), forKey: "User")
    
        //Thread 1: Fatal error: A 'Missing Entitlements' error occurred. This is likely due to an Apple Keychain bug. As a workaround try running on a device that is not attached to a debugger.
        //More information: https://forums.developer.apple.com/thread/4743
        //valetForSharingBetweenApps.set(object: user.retrieveData(), forKey: "User")
    }
    
    @IBAction func retrieveDataFromSecureEnclave(_ sender: Any) {
        //self.retrieveSecretsSharedAmongMultipleApps()
        textView.text = ""
        DispatchQueue.main.async {
            if self.checkEnclaveSecurity() { return }
        }
    }
    
    func retrieveSecretsSharedAmongMultipleApps() {
        textView.text = ""
        /*
         Se você tiver outra aplicação desenvolvida (lembrando que pra situação abaixo funcionar, o outro app deve estar 'assinado' pelo mesmo desenvolvedor) e você quiser compartilhar as informações entre os seus aplicativos, o Valet também faz isso pra você.
         
         Basta usar o método sharedAccessGroupValet, passando a mesma chave que você usa no seu outro app.
         
         No caso que temos aqui, o 'mySharedValet' não consegue acessar as informações do nosso 'valet' local, porque foi usado construtores diferentes.
         Para compartilhar as informações entre os valets, eles devem ser criados com o mesmo construtor
         
         Através do mySharedValet abaixo, você terá acesso apenas as chaves salvas no objeto 'valetForSharingBetweenApps', no caso aqui, apenas a chave 'User' estará armazenada
         */
        guard let identifier = Identifier(nonEmpty: "ValetUniqueIdShared") else { return }
        let mySharedValet = Valet.sharedAccessGroupValet(with: identifier,
                                                         accessibility: .whenUnlocked)
        
        //Recuperando as informações salvas do objeto no Valet
        if let valetData = mySharedValet.object(forKey: "User") {
            let otherUserInstance = User.retriveUser(data: valetData)
            textView.text += "User recuperado do sharedAccessGroupValet salvo no outro app: \(otherUserInstance)"
        }
    }
}

struct User {
    var username: String = ""
    var password: String = ""
    
    //Função mutável, para converter a objeto User para um formata Data
    mutating func retrieveData() -> Data {
        /*
         Para converter uma struct ou classe para formato 'Data', você precisa primeiro localizar o endereço de memória que esse 'objeto' está alocado e depois informar o tamanho de bytes que esse objeto ocupa.
         
         O formato Data, representa um array de bytes alocado na memória do dispositivo, então por isso que nós precisamos localizar onde começa o endereço de memória de um objeto e qual seu tamanho, para que possamos alocar essas mesmas informações dentro de um objeto 'Data'.
         
         Ao passar &self como parametro de bytes, você não está passando o objeto User, mas sim, o endereço de memória que ele está alocado. Logo em seguida, nós informamos o tamanho de bytes que são usados na alocação do objeto. Para descobrir quanto de espaço na memória um objeto ocupa, nós usamos MemoryLayout<obj>.stride.
         */
        return Data(bytes: &self, count: MemoryLayout<User>.stride)
    }
    
    static func retriveUser(data: Data) -> User {
        var user = User()
        /*
         Para recuperar um objeto salvo em formato 'Data', primeiro nós precisamos recuperar o array de bytes que são representados nesse arquivo 'Data'. Para isso nós usamos o método withUnsafeBytes.
         
         ATENÇÃO: Não devemos salvar o array de bytes para usar fora deste closure
         */
        data.withUnsafeBytes { bytes in
            //Use UnsafePointer para acessar os dados de um tipo específico que esteja armazenado na memória, no nosso caso aqui, tipo User.
            //A declaração final pointee, acessa a instância de memória que está referenciada nesse endereço.
            user = UnsafePointer<User>(bytes).pointee
        }
        return user
    }
}

/*
 https://github.com/square/Valet#debugging
 1. Using the wrong Accessibility for your use case. Examples of improper use include using .whenPasscodeSetThisDeviceOnly when there is no passcode set on the device, or using .whenUnlocked when running in the background.
 2. Initializing a Valet with shared access group Valet when the shared access group identifier is not in your entitlements file.
 3. Using SecureEnclaveValet on an iOS device that doesn’t have a Secure Enclave. The Secure Enclave was introduced with the A7 chip, which first appeared in the iPhone 5S, iPad Air, and iPad Mini 2.
 4. Running your app in DEBUG from Xcode. Xcode sometimes does not properly sign your app, which causes a failure to access keychain due to entitlements. If you run into this issue, just hit Run in Xcode again. This signing issue will not occur in properly signed (not DEBUG) builds.
 5. Running your app on device or in the simulator with a debugger attached may also cause an entitlements error to be returned when reading from or writing to the keychain. To work around this issue on device, run the app without the debugger attached. After running once without the debugger attached the keychain will usually behave properly for a few runs with the debugger attached before the process needs to be repeated.
 6. Running your app or unit tests without the application-identifier entitlement. Xcode 8 introduced a requirement that all schemes must be signed with the application-identifier entitlement to access the keychain. To satisfy this requirement when running unit tests, your unit tests must be run inside of a host application.
*/
