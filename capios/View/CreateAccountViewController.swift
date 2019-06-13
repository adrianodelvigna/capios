//
//  CreateAccountViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 07/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Valet

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    let disposeBag: DisposeBag = DisposeBag()
    
    var observableValidateTextFields: Observable<Bool>?
    
    var fieldsAreValid: Variable<Bool> = Variable<Bool>(false)
    
    //Inicialização do Valet usando o construtor padrão valet, informando qual no 'identifier' o nome do sandbox que será criado e qual a 'accessibility' necessária para que o valet tenha acesso ao Keychain, nesse caso, o valet só terá acesso enquanto o device estiver desbloqueado.
    let valet: Valet = Valet.valet(with: Identifier(nonEmpty: "Database")!,
                                   accessibility: .whenUnlocked)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Definição do título da tela na navigationBar
        self.title = "Criar Conta"
        //Função onde são realizados os binds de Rx
        self.bindUI()
    }
    
    func createAccount() {
        //Se os campos estiverem válidos, essa função será chamada e é aqui que nós faremos o armazenamento dos dados no valet.
        if valet.canAccessKeychain() {
            if valet.containsObject(forKey: R.string.main.vaultUsernameKey()) && valet.containsObject(forKey: R.string.main.vaultPasswordKey()) {
                let alert = UIAlertController(title: "Ops", message: "Parece que você já tem uma conta criada nesse dispositivo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            if let username = self.usernameTxtField.text,
                let password = self.passwordTxtField.text {
                valet.set(string: username, forKey: R.string.main.vaultUsernameKey())
                valet.set(string: password, forKey: R.string.main.vaultPasswordKey())
                
                let alert = UIAlertController(title: "Opa!", message: "Conta criada com sucesso", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func bindUI() {
        createAccountButton.rx.tap.subscribe(onNext: {
            //a declaração de weak self em closures, é necessária para evitar possível retenção de memória, por manter referências "fortes" dos elementos desse self
            [weak self] in
            // Um pequeno guard para garantir que o self ainda está disponível para uso
            guard let `self` = self else { return }
            
            if self.fieldsAreValid.value {
                self.createAccount()
            }
        }).disposed(by: self.disposeBag)
        
        //Bind da variável fieldsAreValid, com a atributo hidden da label ErrorMessageLabel
        fieldsAreValid.asObservable().bind(to: self.errorMessageLabel.rx.isHidden).disposed(by: self.disposeBag)
        
        //Criação de um observable, para monitorar se os campos username e password estão com a contagem mínima de carateres necessária, para criar a conta em nosso ambiente simulado
        Observable.combineLatest(usernameTxtField.rx.text,
                                 passwordTxtField.rx.text) {
            username, password -> Bool in
            //Esse bloco de código será chamado, sempre que houver uma alteração nos valores 'text', dos textfields, usernameTxtField e passwordTxtField
            //Nesse if é verificado se o campo 'text' dos textFields é válido, ou seja, 'not nil'
            if let _username = username,
                let _password = password {
                //Se os valores não forem nulos, então nós verificamos se os campos estão respeitando as regras de criação de conta que foi estipulada
                return _username.count >= 6 && _password.count >= 6
            }
            return false
        }.bind(to: fieldsAreValid)
        .disposed(by: self.disposeBag)
    }
}
