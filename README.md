# Programa de Capacitação iOS

## Conteúdo

1. [Toolchain Swift](#toolchain-swift)
1. [Keychain](#keychain)
1. [Acessibilidade](#acessibilidade)
1. [Programação funcional reativa](#programação-funcional-reativa)
1. [Observer Pattern](#observer-pattern)
1. [RxSwift](#rxswift)
1. [Como ler código RxSwift](#como-ler-código-rxswift)
1. [Como escrever código RxSwift](#como-escrever-código-rxswift)
1. [+Operadores +RxMarbles](#operadores-rxmarbles)
1. [MVVM com RxSwift](#mvvm-com-rxswift)
1. [Como ler perguntas e respostas no Stackoverflow!](#como-ler-perguntas-e-respostas-no-stackoverflow)

## Aulas

1. [07/06/2019 (6ª feira)](#1-07062019-6%C2%AA-feira-19h00---22h00)
1. [10/06/2019 (2ª feira)](#2-10062019-2%C2%AA-feira-19h00---22h00)
1. [12/06/2019 (4ª feira)](#3-12062019-4%C2%AA-feira-19h00---22h00)
1. [14/06/2019 (6ª feira)](#4-14062019-6%C2%AA-feira-19h00---22h00)
1. [17/06/2019 (2ª feira)](#5-17062019-2%C2%AA-feira-19h00---22h00)

## Toolchain Swift

*Toolchain*, numa tradução literal: corrente de ferramentas.

No mundo iOS, Xcode, Mac... o termo *toolchain* está ligado ao conjunto de ferramentas usadas para compilar (transformar seu código em algo executável), testar (*debug*) e empacotar seu aplicativo desenvolvido em Swift.

Quando você instala o Xcode no seu Mac, o Xcode já inclui um *toolchain swift* compatível e "*homologado*" com a versão do Xcode que você acabou de instalar. (*É por isso que você tem que, geralmente, atualizar o Xcode se você quiser desenvolver apps para as versões mais recentes do iOS, ou usar novas versões do Swift*)

Porém, caso você não possa atualizar o seu Xcode, tanto por questões de compatibilidade, ou por alguma outra limitação (como falta de permissão na máquina), você pode configurar o seu Xcode atual para usar um *toolchain* diferente, e experimentar versões diferentes do Swift, tanto mais atual, ou ainda mais antigo, caso seja necessário.

Muito importante enfatizar que usando um *toolchain* diferente (para versões diferentes do Swift daquelas embutidas no Xcode) não necessariamente te permitirá explorar versões diferentes do SDK<sup>1</sup> iOS. Outro ponto importante é que ao usar um *toolchain* diferente daquele contido na versão que você está usando do Xcode, você também não vai conseguir publicar aplicativos na App Store.

Finalmente, usar um *toolchain Swift* diferente daquele embutido no Xcode é de certa forma considerado um "*hack*", exclusivamente no sentido de que não é suportado ou endossado pela Apple, quando o objetivo é desenvolver e publicar apps nas lojas. Você estará por sua conta.

Uma outra forma de testar a próxima versão do Swift, e de quebra a próxima versão do SDK iOS, é baixar a versão BETA do Xcode em: https://developer.apple.com/download/. É possível que seja necessário pertencer ao Apple Developer Program (conta paga Apple Developer), para ter acesso a esses downloads.

Mas então, por que eu não uso direto a versão BETA do Xcode? É que, em algumas circunstâncias, uma nova versão do Xcode (11) exige uma nova versão do MacOS (Mojave - 10.14.3+), que por sua vez não é mais compatível com seu velho Mac (MacBook Pro 2011), por exemplo 🙃. Só resta então a alternativa de experimentar com *toolchains* alternativas.

<sup>É possível a instalação de SDKs e o suporte a dispositivos com iOS mais novos em versões antigas do Xcode. Mas isso não pertence ao escopo desse documento. Em tese, um MacOS+Xcode antigos poderiam servir para desenvolvimento e testes de novas versões do Swift (usando um **toolchain** mais atual) e do SDK iOS (instalando um SDK atualizado num Xcode antigo).</sup>

Referências:
- [Resumo do Xcode, toolchains alternativos](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/AlternativeToolchains.html)
- [Switching Swift Versions inside Xcode using Toolchains](https://medium.com/xcblog/switching-swift-versions-inside-xcode-using-toolchains-755b28831c43)
- [Swift 5.0 and XCode 10.1 – Using a Custom Toolchain](https://learningswift.brightdigit.com/swift-5-0-xcode-10-1/)
- [How to install a beta version of Swift](https://www.hackingwithswift.com/example-code/language/how-to-install-a-beta-version-of-swift)
- [Using old versions of Swift in Xcode](https://m.pardel.net/using-old-versions-of-swift-in-xcode-4dd46644a257)

<sup>
<sup><b>1</b></sup> SDK, ou <i>software development kit</i> é o conjunto de ferramentas que você usa para desenvoler apps para o iOS, ou o Mac, ou qualquer outra plataforma na verdade. Quando você pensa em SDK no contexto iOS, pense também na versão do iOS que você pode referenciar, iOS 10, 11, 12, 13...
</sup>

## Keychain

*Keychain*, ou chaveiro, é a solução para armazenamento de dados de forma segura no iOS (e também no Mac, aliás).

Chaveiro talvez não faça justiça do real poder dessa funcionalidade. Talvez a melhor analogia seria com um **cofre**, ou *vault*, em inglês.

Com o Keychain, você pode armazenar senhas, chaves criptográficas, certificados e dados de forma totalmente segura.

O iPhone é referência no mercado, por ser o estado da arte, quando estamos falando de armazenamento totalmente seguro e privacidade, para *smartphones*.

Referências:
- [Serviço de Keychain](https://developer.apple.com/documentation/security/keychain_services)

## Acessibilidade

As funções de acessibilidade permitem que pessoas com limitações possam usufriur da máxima quantidade de funcionalidades possíveis no aplicativo.

No mercado financeiro brasileiro, os requisitos de acessibilidade são regulamentados pelo Banco Central.

A não aderência aos regulamentos estabelecidos pelo Banco Central, podem levar a penalizações e multas aplicadas às instituições financeiras. Além dessas penalidades, é também de interesse dessas instituições financeiras abranger o maior número possível de clientes.

Dentre as funcionalidades mais usadas, e talvez a mais simples de acessibilidade no iOS, está o VoiceOver: um leitor de tela que permite aos usuários navegar pela interface, sem vê-la.

Por padrão, o sistema operacional iOS, já faz pra você alguns passos da acessibilidade. Para testar essa experiência em seu app, basta ir até as configurações: `Ajustes → Geral → Acessibilidade → VoiceOver` e então ativar a opção **VoiceOver**.

A partir desse momento, seu app começar a narrar suas interações e também dará algumas dicas de interação.

> Nossa! Que fantástico! Então não preciso fazer nada?! Praia e água fresca?!

Ahhmmmm, não. Isso só vai trazer as funcionalidades básicas da sua aplicação. Para fornecer uma real experiência ao seu usuário, você deve adicionar descrições e o máximo de informação possível, para que seu app fica entendível, para quem não enxerga. 

> Ahh! Para né.... Dá pra entender tudo que ta acontecendo só com o VoiceOver.

Será mesmo? Faça o seguinte desafio. Ative o VoiceOver do seu device, lá na opção de Ajustes. Depois abra sua aplicação e "feche as cortinas".
Para fechar as cortinas do seu app, basta você tocar na tela, com 3 dedos, 3 vezes. Se por acaso não funcionar, de o tap na tela com 3 dedos, 4 vezes. 

> MEU CANECO! SUMIU TUDO?!

Pois é amigo, agora sim você está no mesmo nível que seu usuário com deficiência visual. Tente navegar no seu app e veja se é tão fácil navegar nele quanto você achou que era. Um pouco diferente né. 
Calma, sem pânico, pra voltar pro estado original, é só repetir a ação que você usou pra fechar as cortinas (3 ou 4 taps na tela usando 3 dedos) 

Agora sim você sabe como é a experiência e o que você TEM que ajustar para que seus usuários entendam e consigam usar sua aplicação.

### Existem 5 atributos propriedades para usar na acessibilidade:

Atributo | Descrição
|:-:|:--|
Label | Um jeito simples e objetivo para descrever um controle ou uma view: "Botão voltar", "imagem de patos"
Traits | Descreve um estado do elemento, comportamento ou uso. Um trait é um enum acessado através de 'UIAccessibilityTrait'. Para uma imagem por exemplo use UIAccessibilityTraitImage 
Hint | Descreve qual ação um elemento faz. Por exemplo: "Mostra os detalhes da receita"
Frame | Não muito usado, o frame irá descrever para o usuário o format CGRect do frame. O VoiceOver nesse caso irá apenas informar os valores de x, y, width e height do frame.
Value | O valor de um elemento. Mais usado para descrever valores de elementos, por exemplo um slider

Como dito anteriormente, para maioria dos elementos, já existe um valor atribuído, você deve apenas aprimorar essa informação para trazer uma melhor experiência para seu usuário.

> Beleza! Agora entendi. Mas putz... Toda que vez que eu for testar ou for fazer uma alteração, eu vou ter que navegar no app no modo VoiceOver ativo?! Meio chato hein...

Caaaaaalma, é óbvio que a Apple não ia te deixar na mão nesse momento né. Pensando nisso, a Apple adicionou ao Xcode, a partir da versão 8, o Accessibility Inspector!

### Accessibility Inspector

Você pode usar o Accessibility Inspector, para simular as interações do VoiceOver com os elementos de acessibilidade e ver quais informações eles estão provendo.

Esse inspector permite que você faça as seguintes tarefas:

* Permite você rodar seu app e identificar erros comuns de acessibilidade.
* Deixa você analisar o atributo de acessibilidade de um elemento UI no modo 'Inspection'
* Você também pode pré-visualizar todos os elementos de acessibilidade sem sair do seu app.
* Tem suporte para todas as plataformas Apple. (macOS, iOS, watchOS, tvOS e provavelmente, mas não mencionado ainda, também funcionará para o novo iPadOS)

> Aí sim hein! Bem mais legal e bem mais interessante. Agora sim eu sinto que vou conseguir adequar meu app da melhor forma. Então como que eu faço pra começar a usar ele?!

Simples! Basta acessar o menu do seu Xcode e navegar até: `Xcode → Open Developer Tool → Accessibility Inspector`. Você vai perceber que seu Xcode instanciou uma nova janela chamada **Accessibility Inspector**.

Nesse inspector você vai encontrar 5 possíveis ações para tomar. 

Ação | Descrição
--- | ---
Target Chooser | Permite que você escolha pra qual device você vai testar.
Inspection Pointer | Com ele selecionado, basta você navegar no simulador e você vai ver que o inspector já começará a exibir informações de acessibilidade sobre os elementos que o mouse passa por cima.
Inspection Detail | Traz todas as informações de acessibilidade do elemento que você está interagindo: Basic, Actions, Element e Hierarchy
Audit | Irá analisar a tela atual que está sendo exibida no simulador (como se fosse auditar o processo de acessibilidade do seu app).
Settings | Essa opção serve pra vc testar outras deficiências sem que você tenha que sair do app, ir nas configurações do dispositivo e manualmente habilitar essas opções. Aqui você encontra algumas opções, como inverção das cores, redução da transparência, redução de movimento e mudança de fonte. Provavelmente, mais opções serão adicionadas futuramente.

> Uhmmm, ok. Mas não tem nada?! Ta marcando meu Mac como target?! Não era pra usar o simulador?! Que que tá acontecendo?!

Calma. Pra ligar o inspector para seu simulador, primeiro você precisa abrir o simulador. Então rode sua aplicação no simulador e após ele ativo, vai lá no 'Accessibility Inspector' que você vai ver que agora o simulador irá aparecer lá no seus Targets. 

Agora basta analisar a tela com o 'Inspection Pointer' e o 'Audit' do 'Accessibility Inspector', para ver quais pontos da sua aplicação aprensenta falhas de acessibilidade. 

Ahh! E não esquece que pra testar realmente se está funcional ou não sua acessibilidade, é ideal que você faça testes no seu app com as "cortinas fechadas"!

Referências:
- [Acessibilidade iOS](https://developer.apple.com/accessibility/ios/)
- [Tutorial - Primeiros passos](https://www.raywenderlich.com/845-ios-accessibility-tutorial-getting-started)


## Programação funcional reativa

Vamos quebrar o título dessa seção, em partes:

- Programação: você, programando...
- Funcional: você, programando, usando funções específicas...
- Reativa: você, programando, usando funções específicas, para **reagir**!

Mas... reagir a que?

### Eventos síncronos

Antes de responder à pergunta da seção anterior, precisamos combinar alguns termos antes. E o primeiro deles é **eventos síncronos**.

Quando pensamos em eventos síncronos, podemos imaginar uma infinidade de eventos, uma teia complicada desses eventos, ocorrendo em **sincronia** entre si. Com uma ordem inerente entre cada evento e o evento subsequente.

Mas vamos simplificar por um momento. Vamos imaginar uma única sequência de eventos. Cada um desses eventos acontecendo depois que o anterior completou. Imagine uma linha, conectando cada um desses eventos.

Melhor, vamos imaginar cada um desses eventos como uma bola de uma cor diferente: verde, azul, vermelha, amarela... e cada um desses eventos conectados por uma única linha. Feche os olhos, e tente imaginar. Consegue? Imaginar uma série de eventos conectados por essa única linha determinando a ordem dos eventos?

Uma reação química, ou a interação de um usuário com o seu app, cada um desses casos podem ser simplificados com o modelo que imaginamos acima. Cada um desses casos pode ser descrito como uma sequência de ação-reação. Pá-pum.

Um tap na tela (ação) que carrega uma nova tela (reação). O pressionar de um botão (ação) que permite o login de um app (reação). A entrada (ação) de texto num campo (reação seria exibir esse texto na tela, por exemplo). Ou a resposta tão esperada do seu servidor/API/endpoint depois do login realizado.

Na programação síncrona - de uma linha de eventos - o evento subsequente **espera** o anterior completar para só então prosseguir. O app não realiza qualquer outra atividade se não esperar pelo evento corrente completar para só então passar para a próxima atividade ou evento subsequente.

Literalmente, na programação síncrona, o app não realiza mais nada além de esperar o evento corrente completar para então continuar com suas atividades. Scroll da tela? Não, o app estará esperando pelo evento corrente concluir. Tap num botão? Também não, nenhuma resposta, desculpe, o app estará ocupado.

Mas poxa, enquanto um dos meus apps baixa aquele meu podcast eu queria poder navegar na internet... Ou responder o Whatsapp! Dá?

Dá. Mas vai nos exigir um pouco mais. Uma forma diferente de pensar.

Vêm à ajuda os eventos assíncronos.

### Eventos assíncronos

Imagine uma nova estória agora. Você está escrevendo um e-mail muito importante, que deve ser enviado ao final do dia; um relatório de fechamento do mês. Mas para completar o e-mail, você precisa de uma informação crucial, que você ainda não tem.

Buscar essa informação lhe tomaria muito tempo. E certamente buscar essa informação atrasaria o envio do e-mail para além do prazo estipulado.

Você está aflito, preocupado. Você sente a tensão crescendo.

Mas de repente, surge uma ideia. Genial. Que tal pedir para seu colega ao lado, que está navegando no UOL, para te ajudar a colocar aquela informação crucial em um arquivo e enviar esse arquivo para você enquanto você continua escrevendo o e-mail?

Se você tiver bons colegas, ele vai aceitar te ajudar, enquanto você continuaria escrevendo o e-mail.

Perfeito! Você se sente bem melhor agora com a ajuda do seu colega. E já acredita que poderá concluir o e-mail no prazo. Você até começa a relaxar um pouco. Você...

1. aguardaria pacientemente pela resposta do seu colega, para só então continuar a escrever o e-mail?
1. ou continuaria escrevendo o email, furiosamente atacando o teclado, aguardando ansiosamente a resposta do seu colega para então enviar o e-mail? E então regojizar-se de sua competência no gerenciamento de tempo?

Se você não for um procrastinador(a) - ou sofrer de algum distúrbio de ansiedade - você possivelmente escolheria a opção (2.). Não seria melhor ter um e-mail pré-pronto, **em andamento**, somente aguardando pequenos ajustes depois da reposta do seu colega, de tal forma que o e-mail possa ser enviado rapidamente? Minimizando qualquer risco de atraso?

A opção (2.) seria uma sequência de **eventos assíncronos**. Você requisitaria uma tarefa (a ajuda do seu colega) de tal forma (assincronamente) que não te impediria de continuar escrevendo o email. Quando seu amigo terminasse de coletar os dados, você receberia um e-mail, ou uma mensagem instantânea com esses dados.

Ciente dessa mensagem (via uma notificação no seu desktop), você pegaria esses dados e compilaria a versão final do e-mail para o relatório de fechamento do mês. Tarefa concluída.

A opção pela escolha número (1.) seria um exemplo de evento síncrono. Onde você, ficaria aguardando a resposta do seu colega. Possivelmente você quem ficaria navegando no UOL enquanto aguarda a resposta :-)

Qual dessas duas opções, a síncrona e a assíncrona, você acredita possuir a propriedade de aproveitar melhor os recursos disponíveis? <sup>*shh, dica, são os exemplos assíncronos!*</sup>

Com esse modelo, **assíncrono**, agora você pode responder àquela mensagem de Whatsapp enquanto é feito o download do seu podcast. Uepaaa! Devolta às maravilhas da modernidade!

## Observer Pattern

> OK então. Eu já sei como tornar a experiência do usuário do meu app mais agradável e produtiva! Bingo! É o modelo assíncrono, certo?! O app se torna capaz de fazer mais de uma coisa ao mesmo tempo, entendi certo, certo!?

*Você se pega pensando...*

> Isso deve ser moleza! Afinal de contas eu consigo mascar chiclete e caminhar ao mesmo tempo! Eu consigo dirigir e responder ao Facebook ao mesmo tempo! Eu sou multi-tarefa! Eu sou um milennial! Eu nasci nesse mundo! Logo...

*Você se pega pensando, ainda... Claramente vítima do viés cognitivo do [efeito Dunning–Kruger](https://en.wikipedia.org/wiki/Dunning–Kruger_effect) por um breve momento.*

> OK. Moleza. Mãos à obra!

*Abruptamente seu pensamento é interrompido. Ploft! Você observa descrente o cursor piscando na tela, impassível, absolutamente resoluto em sua tarefa de piscar. O Xcode está aberto. Pacientemente aguardando por aquelas linhas de código mágicas, que farão tudo acontecer da forma que você imagina. Você então começa a vislumbrar o infinito e o além.*

Você não sabe por onde começar... Isso deve ser difícil para caramba! Programar o seu app para fazer mais de uma coisa ao mesmo tempo!

Primeiro, eu tenho que fazer um ou mais trechos do meu código rodarem de alguma forma paralela. Depois, quando uma ou mais dessas atividades paralelas concluírem, eu preciso coletar o resultado dessas atividades. E além do mais meu app tem que ser bonito e responsivo! Impossível para o prazo que eu tenho!

> Eu deveria mudar minha carreira. Abandonar toda essa porcaria inútil. Talvez estudar letras. Deve ser mais tranquilo, certo? Me tornar escritor? Com meu conhecimento técnico eu poderia escrever alguns artigos, certo? Talvez colocá-los no Github, Medium... Hmmmm.

*Passa rapidamente por sua mente...*

Mas você tem um desafio pela frente. Tornar seu app assíncrono! Tal qual o cursor, que resolutamente pisca na tela, cumprindo a tarefa para a qual foi predestinado, você precisa comprir a sua!

E para ajudá-lo(a) na sua tarefa de tornar seu app assíncrono, **respondendo** a múltiplos eventos enquanto ainda permita ao usuário fazer o scroll da tela, ou até mesmo cancelar a tarefa corrente, recorremos ao padrão de desenvolvimento de software *Observer* (do inglês *Observer pattern*).

Não seria legal se houvesse alguém que te dissesse quando uma tarefa foi executada e te notificasse enquanto você realiza outras atividades, em paralelo?

Melhor ainda, se houvesse algo fazer isso para você, no seu app? Eu não quero dizer ao app como fazer as coisas oras! Eu quero dizer o que ele tem que fazer!

Na verdade eu só gostaria de dizer:

> App, faça essa tarefa e me avise quando terminar. E quando terminar faça isso aqui. Ah! Também, enquanto tudo isso, continue respondendo a toques na tela, scroll e por aí vai, ok? Ok?!

O ideal, é que pudéssemos codificar algo como:

```
• definir uma tarefa que rode assincronamente, em paralelo, como uma funcão, me retornando um resultado

• iniciar essa tarefa, e no momento que ela concluir, executar esse código aqui ó:
    {
        ... código a ser executado ...
    }

• e depois que tudo acabar, limpe todos os recursos utilizados, por favor.
```

No pseudo-código acima acabamos definindo pelo menos três estruturas importantes, que nos ajudariam bastante:

1. a tarefa, que desejamos rodar assincronamente;
1. uma segunda estrutura, que observe a conclusão dessa tarefa;
1. o código que queremos que seja executado, quando a tarefa for concluída;

<sup>E de quebra, também queremos ser eficientes, que todos os recursos não mais utilizados sejam liberados para o uso em outras partes do app. Embora vitalmente importante, esse gerenciamento de recursos não é o foco no momento.</sup>

Com o pseudo-código acima acabamos definindo, muito simplificadamente e para um uso específico, o padrão *Observer* para trechos de código assíncrono<sup>2</sup>:

1. Temos uma estrutura **observável**, nossa tarefa;
1. Temos uma segunda estrutura que **observa** a tarefa, e nos avisa quando a tarefa é concluída;
1. Finalmente, uma terceira estrutura, uma **função**, é executa, em **resposta** à conclusão da tarefa;

### BANG!

Você viu?! Viu?! Acabamos definindo todos os termos geralmente usados para programação funcional responsiva! Do inglês *Functional reactive programming (FRP)!*

Então podemos ter:

Em língua de gente normal | Em língua de programador FRP (hacker<sup>3</sup>)
-- | --
Uma estrutura **observável** | `Observable`
Uma estrutura **observadora** | `Observer`
Uma estrutura usada para **responder** à eventos | `Function` ou `closure` ou `block of code`

Espera aí, você quer dizer então que seria possível eu programar algo como o código abaixo, em Swift?

``` swift
// here we define an observable task that returns a result
func observableTask() -> result {
    /* ... code for the task to run assynchronously ... */
    return result
}

 // here we start the task, and wait for its completion
ObserveCompletionOf(observableTask)
    .whenDone { result in // once the task is complete, we take its result
        /* ... code to be run after 'task' completion ... */
        /* ... eventually use 'result' from 'task' ... */
    }
    .afterDoneReleaseUsedResourcesPlease() 
    // after we're done, we release any resource not longer necessary.
    // In a polite fashion.
```

> Huh... Que massa... Mas eu ainda tenho que escrever uma tarefa observável. Viu ali em cima? Problemas... Problemas! Problemas! De problemas eu já estou cheio! Traga-me soluções!

*Você pensa, enquanto ardilosa e secretamente procura uma justificativa para mudar de aba no navegador... Sua inquetação para ver as últimas atualizações no Facebook só aumenta...*

Você foi ver o Facebook, né? Não? Então pode continuar, você passou no meu teste. Viu o Facebook? Hah! Acho melhor você reler os parágrafos acima, até que você possa conscientemente se livrar desse loop <sub>maligno.</sub>

> OK. Eu já tenho muito código escrito, não vale a pena re-escrever tudo, do zero! O iOS já tem muito código assíncrono pronto: chamade de rede, interação de UI, e eu já usei tudo isso...

*Você pensa, com razão...*

Que tal então se fizéssemos algo como:

``` swift
// Here we define a task that returns an observable result
func task() -> Observable<result> {
    /* ... code for the task to run assynchronously ... */
    return observable.next(result)
}

ObserveCompletionOf(task) // here we start the task, and wait for its completion
    .whenDone { result in // once the task is complete, we take its result
        /* ... code to be run after 'task' completion ... */
        /* ... eventually use 'result' from 'task' ... */
    }
    .afterDoneReleaseUsedResourcesPlease() 
    // after we're done, we release any resource not longer necessary.
    // In a polite fashion.
```

Daí eu uso o código que eu já tenho? Só dou uma "mexidinha" na tarefa para retornar algo que possa ser usado por essa coisa de programação funcional reativa toda?

Isso. Alguém ja enfrentou todo esse problema antes, e criou algo chamado **RxSwift**, para ser usado na programação funcional reativa do iOS<sup>4</sup>.

___
⚠️ **IMPORTANTE**: o *design pattern observer* pode ser implementado de mais de uma forma, ou fazer uso de outros frameworks. Essa não é a única, e nem necessariamente a melhor forma de implementação. Se você tiver alguma sugestão ou alternativa, abra um bug aqui no Github que vamos avaliar se colocamos essa sugestão aqui.
___

<sup>
<sup><b>2</b></sup> O padrão <i>observer</i> pode ser usado para outras circunstâncias também, como a alteração de uma variável, por exemplo. Uma estrutura observa qualquer alteração em dada variável e quando modificada, outro trecho de código é executado em resposta a essa modificação.<br>
</sup>

<sup>
<sup><b>3</b></sup> Fale sobre isso com qualquer pessoa não ligada à informática. Com certeza essa pessoa vai te achar um hacker! Muito inteligente! Ou como forma alternativa de renda. Fale sobre isso com pessoas aleatórias enquanto você aguarda pelo ônibus, ou no cruzamento de semáforos. Essa pessoa aleatória certamente te dará todo o dinheiro na carteira para se livrar de você o mais rápido possível! <b>ATENÇÃO:</b> múltiplas evidências apontam (não me pergunte como) que esse tipo de assunto não é efetivo como: quebra gelo em festas, conversa em primeiro encontro. A não ser que você seja o único na festa. Ou levou um bolo no encontro do Tinder. Daí pode ser divertido (me pergunte como).<br>
</sup>

<sup>
<sup><b>4</b></sup> Existem outros frameworks para a programação funcional reativa para o iOS/Mac. O <a href="https://github.com/ReactiveCocoa/ReactiveCocoa">ReactiveCocoa</a> é também muito conhecido e utilizado. <a href="https://github.com/DeclarativeHub/Bond">Bond</a> é mais uma opção.
</sup>


## RxSwift
___
⚠️ **IMPORTANTE**: **RxSwift** não é a única, e nem necessariamente a melhor, forma de implementação/framework para o *design pattern observer*. Se você tiver alguma sugestão ou alternativa, abra um bug aqui no Github que vamos avaliar se colocamos essa sugestão aqui.
___

O [RxSwift](https://github.com/ReactiveX/RxSwift) é uma biblioteca para a composição de eventos assíncronos usando o pattern de *observáveis*.

A ideia por trás do RxSwift tem sua [origem no ambiente .NET](https://github.com/dotnet/reactive) (e mais [aqui](http://introtorx.com/)), porém com conceitos adaptados para uma integração mais agradável e idiomática no ambiente iOS/Mac.

Além do paradigma de *observáveis*, e *programação reativa*, o RxSwift ainda incorpora um conjunto grande de operadores do que agora é definido como comunidade [Rx](http://reactivex.io/).

Tais operadores (funções na verdade) tem um poder enorme em facilitar a implementação de tarefas complexas, por exemplo:

- quer esperar por dois eventos assíncronos, executando em paralelo, para só então tomar uma ação? Use o operador `combineLatest` ou `zip`;
- quer alterar a resposta de um evento? Use o operador `map`;
- quer que dois ou mais eventos aconteçam um depois do outro? Use o operador `flatMap`;

E muito mais. São [dezenas de operadores](http://reactivex.io/documentation/operators.html) que nos permitem dizer ao app *o que fazer*, e não *como fazer*. Essa forma de programação é muitas vezes chamada de programação **declarativa**, em contraste com a programação **imperativa**, na qual dizemos **como** um programa deve realizar uma tarefa.

Programação declarativa | Programação imperativa
:--: | :--:
O que fazer | Como fazer
Itere por cada elemento do meu `arrayExistente`, execute a função `f(elementoArray)` e me retorne um `arrayNovo` com o resultado. | Aloque um `arrayNovo`. Pegue o primeiro item do `arrayExistente` cujo index `i` tenha valor `1`. Enquanto o valor desse index seja menor que o tamanho do `array`, para cada elemento do `array[i]` execute a função `f(elementoArray)` e adicione o resultado ao `arrayVazio`. Incremente o index `i` em `1`, sempre observando o tamanho do `arrayExistente`. Quando `i` for maior que o tamanho do `arrayExistente`, pare.

**Exemplo** de programação declarativa (usando Swift):
``` swift
// Here, we just declare what should be done
let arrayNovo = [1, 2, 3, 4].map { item in item + 1 }
// arrayNovo = [2, 3, 4, 5]
```

**Exemplo** de programação imperativa (usando C):
``` C
// Here, we declare how to allocate the new array
// How to iterate trough the existing array
// And how to apply the calculated value to the new array
int arrayExistente[4] = {1, 2, 3, 4};
int arrayNovo[4];

for (int i = 0; i < 4; i++)
{
    arrayNovo[i] = arrayExistente[i] + 1;
}
```

<sup>Apenas deixando claro que ambas as formas de programação são compatíveis com as linguagens C e Swift - limitados às restrições de sintaxe de cada linguagem. Os exemplos acima foram usados apenas para evidenciar o ponto da programação declarativa <i>versus</i> a imperativa.</sup>

### OK! Tudo mundo junto agora!

Todos esses conceitos, programação funcional reativa, o *pattern observer*, e a adaptação à sintaxe da linguagem Swift, permitem que escrevamos esse tipo de código:

```swift
Observable.combineLatest(firstName.rx.text, lastName.rx.text) { $0 + " " + $1 }
    .map { "Greetings, \($0)" }
    .bind(to: greetingLabel.rx.text)
```

Onde combinamos os valores mais atuais de dois elementos de entrada de texto, criamos uma nova string concatenando os dois textos, criamos uma string de saudação, e finalmente conectamos tudo isso a uma label. Três linhas de código!

Agora, imagine a implementação dos métodos do [protocolo UITextFieldDelegate](https://developer.apple.com/documentation/uikit/uitextfielddelegate), o controle para sabermos qual entrada de texto foi alterada para concatenarmos a string corretamente, criarmos uma string de saudação, para só então atualizarmos uma label. É um bocado de coisa para pensar. Numa situação relativamente simples.

Se conseguirmos aprender os termos usados pelo **RxSwift**, podemos abstrair (até certo ponto) como realizar algumas das atividades "mecânicas", ou repetitivas, do nosso app. Nos permitindo aplicar um foco ainda maior no propósito para que o app está sendo desenvolvido - ou focarmos nas regras do negócio, como também é mencionado.

Imagina poder conectar um *array* de elementos, diretamente com uma table view, de tal modo que quando esse *array* de elementos seja modificado/atualizado a table view seja atualizada automaticamente? Você já imaginou isso?

O **RxSwift** pode te ajudar a fazer tudo isso! Observe<sup>5</sup>!

```swift
viewModel
    .rows
    .bind(to: resultsTableView.rx.items(cellIdentifier: "WikipediaSearchCell",
          cellType: WikipediaSearchCell.self)) { (_, viewModel, cell) in
        cell.title = viewModel.title
        cell.url = viewModel.url
    }
    .disposed(by: disposeBag)
```

<sup>\<*Locução super-empolgada*></sup>
<br>E não é só isso! Aderindo agora ao **RxSwift** você também leva:

- Uma forma fácil de dizer ao código para continuar tentando uma operação em caso de erros, de forma simples e fácil!
- Uma alternativa (possivelmente mais simples) para o uso de *delegates*!
- Seu aplicativo quebra/*"crasheia"* pelo uso de KVOs? **RxSwift** tem uma alternativa para você!
- Você quer mandar uma requisição a um endpoint somente depois de passado um determinado tempo depois de um último evento? **RxSwift** tem uma solução!

Aumente sua potência como programador(a) sem precisar de Ginseng ou GranSênior!

Tudo isso trazido para você pela Polishop!

Veja alguns testemunhos!
<br><sub>\<*/Locução super-empolgada*></sub>

<sub>\<*dublagem fora de sincronia<sup>6</sup> com os movimentos labiais*></sub>

> Desde que eu comecei a usar o **RxSwift**, eu não quero mais olhar para trás. Eu uso o **RxSwift** para tudo!

> Eu uso o **RxSwift** para tudo agora. Validação de formulários. Requisições de APIs. Atualizar minha interface. É uma maravilha! E o melhor de tudo? Eu consigo integrar meu código existente com um esforço bem pequeno! Eu aprovo!

> O **RxSwift** se mostrou crucial na nossa busca pela forma perfeita de implementação do MVVM. Sem o **RxSwift**, isso não seria possível.

> MVVM? MVC? MVP? VIPER? Com **RxSwift** eu consigo migrar para a arquitetura de app da semana, facilmente! Sem suar!

<sup>\<*/dublagem fora de sincronia com os movimentos labiais*></sup>

Faça o checkout, configure seu *Podfile*, e confira os resultados você mesmo!

Da mesma forma que os preços dos produtos da Polishop, o **RxSwift** pode apresentar um "preço de aprendizado" inicial alto<sup>7</sup>, porém, os ganhos a longo prazo podem ser bastante recompensadores, mesmo que em um uso restrito a algumas funcionalidades do seu app.

Numa analogia, pense em aprimorar seu vocabulário em inglês, adicionando novas palavras ao seu repertório. Mas nesse caso estaremos aprendendo um punhado de novos conceitos, e algumas dezenas de novas palavras (ou operadores/funções). E você já estará com seu *mindset* na direção certa.

É também consenso entre os programadores **Rx**, **RxSwift** que praticamente a totalidade do entendimento e a fluência no paradigma e bibliotecas vêm da experimentação, do uso contínuo principalmente. 10% vêm do estudo, e 90% vêm da prática. Então tenha **sempre** isso em mente.

### Referências

- [Why Rx[Swift]](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Why.md)
- [Getting Started With RxSwift and RxCocoa](https://www.raywenderlich.com/1228891-getting-started-with-rxswift-and-rxcocoa)
- [RxSwift For Dummies 🐣 Part 1](http://web.archive.org/web/20181004041223/http://swiftpearls.com/RxSwift-for-dummies-1-Observables.html)
- [RxSwift For Dummies 🐥 Part 2](http://web.archive.org/web/20180926004433/http://swiftpearls.com/RxSwift-for-dummies-2-Operators.html)
- [RxSwift For Dummies 🐤 Part 3](http://web.archive.org/web/20180922083311/http://swiftpearls.com/RxSwift-for-dummies-3-Subjects.html)
- [RxSwift Safety Manual 📚](http://web.archive.org/web/20181010143132/http://swiftpearls.com/RxSwift-Safety-Manual.html)


<sup>
<sup><b>5</b></sup> Pun intended.<br>
</sup>
<sup>
<sup><b>6</b></sup> Seriam as dublagens fora de sincronia, <i>assíncronas</i>? Seriam as novelas mexicanas então, candidatas ao uso do <b>RxSwift</b>?
</sup>
<sup>
<br>
<sup><b>7</b></sup> Os sintomas incluem, mas não estão limitados a, perda de cabelo, esbranquecimento dos fios de cabelo restantes, indigestão, azia, úlcera, insônia, pesadelos com <b>RxSwift</b> quando você conseguir dormir, vontade de chorar e arrependimento. A persistirem os sintomas, continue tentando.<br>
</sup>

## Como ler código RxSwift

OK. Se você chegou até aqui (e assistiu a aula (2.) principalmente), você já deve ter uma ideia melhor do que é essa coisa toda de programação funcional reativa e um pouquinho de **RxSwift**. Nesse momento, você deve ter em mente que no cerne de toda essa discussão estão coisas que acontecem fora de ordem: o toque em um botão, uma notificação, um timer que expirou, ou a resposta de uma chamada a um endpoint de rede. Esses são **eventos** **assícronos**: que o app não consegue predizer quando vão acontecer, mas que o app - mesmo assim - precisa estar pronto para quando eles aconteçam.

O método tradicional para responder a esses **eventos assíncronos** (na plataforma iOS em especial) se baseia no uso de *delegates*, *KVOs*, *notificações* e *callbacks*. Já com bibliotecas como o **RxSwift**, esses **eventos assíncronos** são tratados declarativamente, por meio de funções (*operadores* no jargão reativo). Declarativamente dizemos *o que fazer* e não *como fazer*.

Depois desse resumo, vamos tentar traduzir alguns exemplos comuns da programação com **RxSwift**, para que a leitura desse tipo de código seja mais natural e então nos proporcione a escrita de tal tipo de código, como objetivo final. Vamos tentar criar uma [pedra de rosetta](https://en.wikipedia.org/wiki/Rosetta_Stone) 😊.

### Exemplo 1: Eventos numéricos

```swift
let observable = Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
// Foi criado algo observável. Uma sequência de números inteiros, incrementais, começando de zero
// a cada segundo. Esse evento assíncrono vai rodar na threat prinicipal, a da interface gráfica (UI)


let observer = observable
    .subscribe(
    onNext: {
        print("--\($0)", terminator: "")
        // a cada elemento (número inteiro) gerado, ele é exibido na área de debug
    },
    onError: { error in
        print("--X (\(error.localizedDescription))")
        // se no momento de gerar um inteiro, algo der errado, exibe esse erro
        // (a princípio isso nunca deve acontecer com o exemplo observável acima)
    },
    onCompleted: {
        print("--| (Observable completed)")
        // se o observável indicar que ele concluiu sua geração de números inteiros,
        // informamos tal fato na área de debug
    },
    onDisposed: {
        print(" ..Resources released")
        // também mostramos quando todos os recursos usados pelo par observável/observador
        // for liberado, para ter certeza que não temos nenhum problema no futuro
    })
// Foi criado um observador, apartir da sequência de inteiros observável acima.

// O único trabalho desse observador é nos mostrar as possíveis sequências de eventos.

// Nesse caso específico, o observável só começa a gerar eventos, isto é, números inteiros
// a cada segundo, quando o observador subscreve à sequência de eventos, literalmente o
// objetivo do método .subscribe(...).

// Dessa forma, nenhum evento (ou número inteiro) é perdido desde o momento que o observável é
// criado e o momento que o observador é criado e subscreve à sequência de eventos.
```

O trecho de código acima, se apropriadamente inserido dentro de um projeto iOS, vai gerar a seguinte saída na área de debug do Xcode:

```
--(0)--(1)--(2)--(3)--(4)--(5)--(6)--(7)-- ...
```

Idealmente, o seu app vai continuar gerando números inteiros sequenciais para sempre, até o universo esfriar. Esse tipo de observável não nos permite, sem ajustes, emitir eventos de erro (*error*), ou conclusão (*complete*).

Mas caso um evento de conclusão fosse emitido, ele seria exibido como a barra vertical no exemplo abaixo:

```
--(0)--(1)--(2)--(3)--(4)--(5)--(6)--| (Observable completed)
```

E no caso de um evento de erro:

```
--(0)--(1)--(2)--(3)--X (Ixi, deu erro!)
```

Note, que as saídas na área de debug acima foram propositalmente formatadas para se parecer o máximo possível com os exemplos da documentação oficial do [RxSwift, Getting Started](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md).

Veja alguns exemplos no projeto Xcode contido nesse repositório. Outra fonte valiosa de exemplos é o próprio repositório do [**RxSwift** no Github](https://github.com/ReactiveX/RxSwift), especialmente as pastas [RxExample](https://github.com/ReactiveX/RxSwift/tree/master/RxExample) e [RxTest](https://github.com/ReactiveX/RxSwift/tree/master/RxTest)<sup>8</sup>.

Agora que já estamos um pouco mais familiarizados com a leitura de um exemplo simples em **RxSwift**, vamos expandí-lo com alguns operadores, que nada mais são que funções que alteram o conteúdo de um **evento assíncrono**, ou até mesmo encadeiam um ouro tipo de **evento assíncrono** como resultado de um primeiro **evento assíncrono**.

Vamos partir de onde paramos no exemplo acima, de observável e observador, mas agora, vamos remover os comentários acima, e comentar somente o código e operadores adicionados. Se ainda houverem quaisquer dúvidas a respeito de código não comentado abaixo, verifique se o mesmo trecho de código está comentado acima, para maiores esclarecimentos.

### Exemplo 2: Transformando eventos numéricos

```swift
let observable = Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)

let observer = observable
    .debug()
    .map { $0 + 1 }
    .debug()
    .subscribe(
    onNext: {
        print("--\($0)", terminator: "")
    },
    onError: { error in
        print("--X (\(error.localizedDescription))")
    },
    onCompleted: {
        print("--| (Observable completed)")
    },
    onDisposed: {
        print(" ..Resources released")
    })
```

*Mais... no próximo commit.*

### Referências

- [RxSwift For Dummies 🐣 Part 1](http://web.archive.org/web/20181004041223/http://swiftpearls.com/RxSwift-for-dummies-1-Observables.html)
- [RxSwift For Dummies 🐥 Part 2](http://web.archive.org/web/20180926004433/http://swiftpearls.com/RxSwift-for-dummies-2-Operators.html)
- [rx-marin blog](http://rx-marin.com/)

<sup>
<sup>8</sup> Se você se deparar com um projeto com documentação deficiente no Github, veja se o projeto possui um conjunto de testes. Muitas vezes, apenas entendendo o que esse conjunto de testes faz, já é possível entender como o código em questão deve ser usado, contornando deficiências de documentação.
</sup>


## Como escrever código RxSwift

Podem-se adotar alguns passos básicos na escrita de código **RxSwift**. Em forma de checklist:

- [ ] Identifique a fonte de eventos assíncronos, e.g., toque em botões, notificações, timers, repostas de uma API via rede;
- [ ] Identifique quaisquer fontes adicionais de eventos assíncronos;
- [ ] Identifique onde e como a(s) fonte(s) de evento(s) assíncrono(s) devem ser usado(s)/consumido(s);
- [ ] Identifique o conjunto de operador(es) que vão transformar a(s) fonte(s) de evento(s) assíncrono(s) desde sua origem até o formato de consumo final;
- [ ] Identifique o formato que os recursos usados para o par observável/observador devem ser liberados quando não mais necessários;
- [ ] Valide que o conjunto de eventos atinja o(s) requisito(s);
- [ ] Verifique oportunidades de *binding* direto;

Opcional

- [ ] Verifique quaisquer oportunidades de simplificar ou tornar mais legível o conjunto de operador(es) de transformação utilizado(s);

🎗Para aprender o **RxSwift** você não necessariamente precisa se restringir às fontes (artigos, livros, vídeos, cursos) do **RxSwift**. Por ser quase um padrão (**ReactiveX**) outras bibliotecas como o [RxJS](https://github.com/ReactiveX/rxjs), [RxJava](https://github.com/ReactiveX/RxJava), [Rx .Net](https://github.com/ReactiveX/RxJava) podem servir como mais uma referência, especialmente no uso de operadores. Até mesmo bibliotecas como as supra-citadas <a href="https://github.com/ReactiveCocoa/ReactiveCocoa">ReactiveCocoa</a> e <a href="https://github.com/DeclarativeHub/Bond">Bond</a> (que não necessariamente implementam o padrão **ReactiveX**) possuem documentação que podem complementar o entendimento dos conceitos mais básicos.

## +Operadores +RxMarbles

TBC

## MVVM com RxSwift

TBC

### Referências

- [RxSwift MVVM API Manual 📃](http://web.archive.org/web/20180728071049/http://swiftpearls.com/mvvm-state-manage.html)

## Como ler perguntas e respostas no Stackoverflow!

TBC

## 1: 07/06/2019 (6ª feira) 19h00 - 22h00

Hora Aprox. | Tópico | Detalhes
--- | :-: | ---
19h00<br>19h30 | Toolchain<br><sup>Adriano</sup> | • Pincelada sobre o assunto.<br>• Pra que serve?<br>• O que ele faz?<br>• Onde ele vive?<br>• Do que se alimenta?<br>• Como se reproduz?<br>• Como e onde baixar; como substituir o toolchain atual pelo toolchain baixado;
19h30<br>20h20 | Keychain<br><sup>Chico</sup> | • O que é?<br>• O que é a lib Valet e porque usa-lá? (ou porque usar qualquer outra)<br>• Como salvar e acessar o Keychain usando Valet?<br>• Quais os tipos de Valet e o que cada um faz: **Valet**, **SecureEnclaveValet**, **SinglePromptSecureEnclaveValet**;<br>• Quais os construtores o Valet tem e qual a diferença entre eles?
20h20<br>20h30 | Intervalo | 💩
20h30<br>21h00 | Acessibilidade<br><sup>Chico</sup> | <br>• Como ativar<br>• Falar sobre as funcionalidades básicas e o que geralmente não é abrangido pelo **VoiceOver** nativamente<br>• Falar rapidamente sobre os 5 atributos existentes (label, traits, hint, frame, value)<br>• Como testar acessibilidade com o simulador (Accessibility Inspector)<br>• Ativar funcionalidade "*fechar cortinas*"
21h00<br>22h00 | Exercícios / Hora livre | Liberar o restante da aula para a resolução do exercício e tirar dúvidas;

### App de Exercício

1. App simples com:
    1. tela para criação de conta de usuário
        1. Simular um endpoint pelo armazenamento/leitura na *Keychain*
            - Usar o secure enclave keychain (biometria)
        1. *bind* simples de exemplo para validação na hora de criar a conta (Allan e Chico)
    1. criar do zero a tela de login para exercitar o uso do *Keychain* (Alunos+instrutores)
        1. Sugerir a validação dos campos sendo feita com **UITextField** *delegates*, como usual
    1. adicionar propriedades de acessibilidade para todas as telas existentes no projeto

- Lição de casa terminar as telas caso necessário.

### Referências 
- [Valet](https://github.com/square/Valet)
- [Implementação Manual Wrapper Keychain](https://medium.com/ios-os-x-development/securing-user-data-with-keychain-for-ios-e720e0f9a8e2)

## 2: 10/06/2019 (2ª feira) 19h00 - 22h00

Hora Aprox. | Tópico | Detalhes
--- | :-: | ---
19h00<br>20h20 | RxSwift<br><sup>Adriano & Allan</sup> | • Exposição do RxSwift: [Programação funcional reativa](#programação-funcional-reativa) → [Como ler código RxSwift](#como-ler-código-rxswift)
20h20<br>20h30 | Intervalo | 🍫🥤🥪
20h30<br>22h00 | RxSwift<br><sup>Adriano & Allan</sup> | • observável: `Observable<Int>.interval(...)`<br>• método `.subscribe(...)`<br>• método `.debug()`<br>• eventos: `onNext`, `onError`, `onCompleted`, `onDisposed`<br>• observável: `button.rx.tap`<br>• operador: `.map {...}`<br> • operador: `.flatMap {...}`<br> • operador: `.filter {...}`<br>• método:`.disposed(by:...)`<br>• método: `.bind(to:...)`<br><sub>Ver `Exemplo1.swift` e `Exemplo2.swift`</sub>

## 3: 12/06/2019 (4ª feira) 19h00 - 22h00

Hora Aprox. | Tópico | Detalhes
--- | :-: | ---
19h00<br>20h20 | RxSwift<br><sup>Chico & Adriano</sup> | • Continuação do RxSwift.<br>• Mostrar o uso do `map` e do `flatMap`<br>• Uso de JSON + Swagger
20h20<br>20h30 | Intervalo | 🍕🍕🍕 + 🥤 + 🍦 = 💩
20h30<br>22h00 | RxSwift<br><sup>Chico & Adriano</sup> | • Cenários de chamadas de endpoints consecutivas e formatar uma *model*

## 4: 14/06/2019 (6ª feira) 19h00 - 22h00

- TBD de acordo com o progresso da turma

## 5: 17/06/2019 (2ª feira) 19h00 - 22h00

- TBD de acordo com o progresso da turma
- \+ considerações finais


## Work In Progress

- [Modelagem de atividades extra-classe](HomeWorkModels.md)