Fluxo de didática CAPiOS

Transição de tela: R.swift

- Ir para uma nova tela.
- Ir para uma nova tela em um novo storyboard.
- Adicionar uma imagem no projeto e usar.
- Criar dois ou mais arquivo de strings.
- Consumir dados do arquivo de strings.
- Usar uma string com variável imbutida.

RxSwift
* Compreender conceitos de Observables e Drivers
* Explicação básica para que entendam o conceito:
1. Profº1 é dono do textField e ele é o único cara que sabe o que tem naquele textField.
2. O Profº2 é um curioso e ele é o cara que quer saber tudo que acontece no textField.
3. Então ele vai até o Profº1 e diz que gostaria de assinar o “newsLetter” desse textField (ou seja, fazer um subscribe no textField).
4. Nesse momento, o Profº1, decide tornar o textField dele Observável (transforma o textField em um Observable)
5. Agora o Profº2 pode assinar o Observable do Profº1, e aí toda vez que acontecer qualquer tipo de interação com o textField, o Profº2 vai saber, pq agora ele é um assinante do Observable.

* Atividades práticas para entender o funcionamento
- Realizar exercícios com os operadores:
- Map
- FlatMap
- Map vs FlatMap
- Filter
- Throttle
- Debounce
- CombineLatest
- Scheduler

* Diferença entre Subjects e quando usa-los:
Tipos de Subjects - Subsjects só chamam o onCompleted quando são unsubscribed/deregistered
- PublishSubject - quando um subscriber (observer) assina, ou seja, deseja acompanhar as notificações desse publishSubject (no caso, como observable), ele só vai receber eventos que forem disparados a partir daquele momento 
* Exemplo, um slider que precisa alterar o valor de uma label, conforme ele for alterado.

- BehaviorSubject - Se você precisa que novos subscribers (Observers) sempre recebam o evento ‘onNext’ mais recente, mesmo que tenham ‘assinado’ depois do evento ser emitido, behaviourSubject é o Cara. Ele é iniciado com um valor inicial e então, ele replica para os novos subscribers o próximo evento, contendo o elemento mais recente ou o valor inicial, caso não tenha sido disparado nenhum evento ainda.
* Exemplo, 

- ReplaySubject - Muito parecido com o BehaviorSubject, porém envia não só o mais recente evento, mas um buffer dos últimos eventos disparados. É inicializado com um tamanho de buffer (quantidade de elementos à reenviar) que não pode ser alterado depois de inicializado.
* Exemplo,

- Variable = deprecated - Usar BehaviorRelay



Referencias:

RxSwift
* https://codeburst.io/rxswift-reactive-thinking-part-2-efb209237e6e - Bons exemplos de Subjects
* https://medium.com/@navdeepsingh_2336/creating-an-ios-app-with-mvvm-and-rxswift-in-minutes-b8800633d2e8
* https://medium.com/ios-os-x-development/learn-and-master-%EF%B8%8F-the-basics-of-rxswift-in-10-minutes-818ea6e0a05b
* https://www.thedroidsonroids.com/blog/rxswift-by-examples-1-the-basics/
* https://codeburst.io/rxswift-reactive-thinking-part-1-71f361af6ea7
* https://hub.packtpub.com/reactive-programming-in-swift-with-rxswift-and-rxcocoa-tutorial/ https://www.youtube.com/watch?v=NzsoAAzZtBE https://www.youtube.com/watch?v=W3zGx4TUaCE
* https://www.raywenderlich.com/900-getting-started-with-rxswift-and-rxcocoa
* http://swiftpearls.com/RxSwift-for-dummies-1-Observables.html
* https://medium.com/fantageek/throttle-vs-debounce-in-rxswift-86f8b303d5d4

