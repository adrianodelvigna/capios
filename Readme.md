# Programa de Capacitação iOS

## Acessibilidade

As funções de acessibilidade permitem que pessoas com limitações possam usufriur da máxima quantidade de funcionalidades possíveis no aplicativo.

No mercado financeiro brasileiro, os requisitos de acessibilidade são regulamentados pelo Banco Central.

A não aderência aos regulamentos estabelecidos pelo Banco Central, podem levar a penalizações e multas aplicadas às instituições financeiras. Além dessas penalidades, é também de interesse dessas instituições financeiras abranger o maior número possível de clientes.

Dentre as funcionalidades mais usadas, e talvez a mais simples de acessibilidade no iOS, está o VoiceOver: um leitor de tela que permite aos usuários navegar pela interface, sem vê-la.

Referências:
- https://developer.apple.com/accessibility/ios/

## Toolchain

*Toolchain*, numa tradução literal: corrente de ferramentas.

No mundo iOS, Xcode, Mac... o termo *toolchain* está ligado ao conjunto de ferramentas usadas para compilar (transformar seu código em algo executável) seu aplicativo.

Quando você instala o Xcode no seu Mac, o Xcode já inclui um *toolchain* compatível com a versão do Xcode que você acabou de instalar. (*É por isso que você tem que, geralmente, atualizar o Xcode se você quiser desenvolver apps para as versões mais recentes do iOS, ou usar novas versões do Swift*)

Porém, caso você não possa atualizar o seu Xcode, tanto por questões de compatibilidade, ou por alguma outra limitação (como falta de permissão), você pode configurar o seu Xcode atual para usar um *toolchain* diferente, e experimentar versões diferentes do Swift, tanto mais atual, ou ainda mais antigo, caso seja necessário.

Muito importante enfatizar que usando um *toolchain* diferente (para versões diferentes do Swift daquelas embutidas no Xcode) não necessariamente te permitirá explorar versões diferentes do SDK<sup>1</sup> iOS.

Referências:
- https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/AlternativeToolchains.html


<small>
<sup>1</sup> SDK, ou <i>software development kit</i> é o conjunto de ferramentas que você usa para desenvoler apps para o iOS, ou o Mac, ou qualquer outra plataforma na verdade. Quando você pensa em SDK no contexto iOS, pense também na versão do iOS que você pode referenciar, iOS 10, 11, 12, 13...
</small>


## Keychain

*Keychain*, ou chaveiro, é a solução para armazenamento de dados de forma segura no iOS (e também no Mac, aliás).

Chaveiro talvez não faça justiça do real poder dessa funcionalidade. Talvez a melhor analogia seria com um **cofre**, ou *vault*, em inglês.

Com o Keychain, você pode armazenar senhas, chaves criptográficas, certificados e dados de forma totalmente segura.

O iPhone é referência no mercado, por ser o estado da arte, quando estamos falando de armazenamento totalmente seguro e privacidade, para *smartphones*.

Referências:
- https://developer.apple.com/documentation/security/keychain_services

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

### Observer Pattern

> OK então. Eu já sei como tornar a experiência do usuário do meu app mais agradável e produtiva! Bingo! É o modelo assíncrono, certo?! O app se torna capaz de fazer mais de uma coisa ao mesmo tempo, entendi certo, certo!?

*Você se pega pensando...*

> Isso deve ser moleza! Afinal de contas eu consigo mascar chiclete e caminhar ao mesmo tempo! Eu consigo dirigir e responder ao Facebook ao mesmo tempo! Eu sou multi-tarefa! Eu sou um milennial! Eu nasci nesse mundo! Logo...

*Você se pega pensando, ainda... Claramente vítima do viés cognitivo do [efeito Dunning–Kruger](https://en.wikipedia.org/wiki/Dunning–Kruger_effect) por um breve momento.*

> OK. Moleza. Mãos à obra!

*Abruptamente seu pensamento é interrompido. Ploft! Você observa descrente o cursor piscando na tela, impassível, absolutamente resoluto em sua tarefa de piscar. O Xcode está aberto. Pacientemente aguardando por aquelas linhas de código mágicas, que farão tudo acontecer da forma que você imagina. Você então começa a vislumbrar o infinito e o além.*

Você não sabe por onde começar... Isso deve ser difícil para caramba! Programar o seu app para fazer mais de uma coisa ao mesmo tempo!

Primeiro, eu tenho que fazer um ou mais trechos do meu código rodarem de alguma forma paralela. Depois, quando uma ou mais dessas atividades paralelas concluírem, eu preciso coletar o resultado dessas atividades. E além do mais meu app tem que ser bonito e responsivo! Impossível para o prazo que eu tenho!

> Eu deveria mudar minha carreira. Abandonar toda essa porcaria inútil. Talvez estudar letras. Deve ser mais tranquilo, certo? Me tornar escritor? Com meu conhecimento técnico eu poderia escrever alguns artigos, certo? Talvez colocá-los no Github... Hmmmm.

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

<small>E de quebra, também queremos ser eficientes, que todos os recursos não mais utilizados sejam liberados para o uso em outras partes do app. Embora vitalmente importante, esse gerenciamento de recursos não é o foco no momento.</small>

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

Espera aí, você quer dizer então que seria possível então eu programar algo como o código abaixo, em Swift?

``` swift
func observableTask() -> result { // here we define an observable task that returns a result
    /* ... code for the task to run assynchronously ... */
    return result
}

ObserveCompletionOf(observableTask) // here we start the task, and wait for its completion
    .whenDone { result in // once the task is complete, we take its result
        /* ... code to be run after 'task' completion ... */
        /* ... eventually use 'result' from 'task' ... */
    }
    .afterDoneReleaseUsedResourcesPlease() // after we're done, we release any resource not longer necessary. In a polite fashion.
```

> Huh... Que massa... Mas eu ainda tenho que escrever uma tarefa observável. Viu ali em cima? Problemas... Problemas! Problemas! De problemas eu já estou cheio! Traga-me soluções!

*Você pensa, enquanto ardilosa e secretamente pensa em uma justificativa para mudar de aba no navegador... Sua inquetação para ver as últimas atualizações no Facebook só aumenta...*

Você foi ver o Facebook, né? Não? Então pode continuar, você passou no meu teste. Viu o Facebook? Hah! Acho melhor você reler os parágrafos acima, até que você possa conscientemente se livrar desse loop <sub>maligno.</sub>

> OK. Eu já tenho muito código escrito, não vale a pena re-escrever tudo, do zero! O iOS já tem muito código assíncrono pronto: chamade de rede, interação de UI, e eu já usei tudo isso...

*Você pensa, com razão...*

Que tal então se fizéssemos algo como:

``` swift
func task() -> Observable<result> { // here we define a task that returns an observable result
    /* ... code for the task to run assynchronously ... */
    return observable.next(result)
}

ObserveCompletionOf(task) // here we start the task, and wait for its completion
    .whenDone { result in // once the task is complete, we take its result
        /* ... code to be run after 'task' completion ... */
        /* ... eventually use 'result' from 'task' ... */
    }
    .afterDoneReleaseUsedResourcesPlease() // after we're done, we release any resource not longer necessary. In a polite fashion.
```

Daí eu uso o código que eu já tenho? Só dou uma "mexidinha" na tarefa para retornar algo que possa ser usado por essa coisa de programação funcional reativa toda?

Isso. Alguém ja enfrentou todo esse problema antes, e criou algo chamado **RxSwift**, para ser usado na programação funcional reativa do iOS<sup>4</sup>.

⚠️ **IMPORTANTE**: o *design pattern observer* pode ser implementado de mais de uma forma, ou fazer uso de outros frameworks. Essa não é a única, e nem necessariamente a melhor forma de implementação. Se você tiver alguma sugestão ou alternativa, abra um bug aqui no Github que vamos avaliar se colocamos essa sugestão aqui.

<small>
<sup>2</sup>O padrão <i>observer</i> pode ser usado para outras circunstâncias também, como a alteração de uma variável, por exemplo. Uma estrutura observa qualquer alteração em dada variável e quando modificada, outro trecho de código é executado em resposta a essa modificação.

<sup>3</sup>Fale sobre isso com qualquer pessoa não ligada à informática. Com certeza essa pessoa vai te achar um hacker! Muito inteligente! Ou como forma alternativa de renda. Fale sobre isso com pessoas aleatórias enquanto você aguarda pelo ônibus, ou no cruzamento de semáforos. Essa pessoa aleatória certamente te dará todo o dinheiro na carteira para se livrar de você o mais rápido possível! <b>ATENÇÃO:</b> múltiplas evidências apontam (não me pergunte como) que esse tipo de assunto não é efetivo como: quebra gelo em festas, conversa em primeiro encontro. A não ser que você seja o único na festa. Ou levou um bolo no encontro do Tinder. Daí pode ser divertido (me pergunte como).

<sup>4</sup>Existem outros frameworks para a programação funcional reativa para o iOS/Mac. O [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) é também muito conhecido e utilizado. [Bond](https://github.com/DeclarativeHub/Bond) é mais uma opção.
</small>

### RxSwift

⚠️ **IMPORTANTE**: **RxSwift** não é a única, e nem necessariamente a melhor, forma de implementação/framework para o *design pattern observer*. Se você tiver alguma sugestão ou alternativa, abra um bug aqui no Github que vamos avaliar se colocamos essa sugestão aqui.

*Continua... no próximo commit.*

### RxMarbles + Operadores

### Como ler código RxSwift

### Como escrever código RxSwift

### MVVM com RxSwift

### Como ler perguntas e respostas no Stackoverflow!



### Modelagem das atividades
Para as atividades iniciais (de aprendizagem), será solicitado que os estudantes façam modificações em seus próprios projetos de conclusão:
Ex: 
* Usar Keychain para o sistema de login do app.
* Substituir taps de botões, por funções Rx.
* Apps devem usar pesquisa com API usando throttle na searchbar.
* Fazer transições de tela usando Rswift.
* Criar arquivos de internacionalização para strings.
**** APENAS COMO SUGESTÃO **** Inserir as regras padrões de SwiftLint usados aqui, nos projetos individuais, para que se habituem e tenham uma menor resistência quando entrarem aqui. Sem contar que lint é extremamente usado por diversas empresas, então acredito agregar valor. 

Dessa forma, os alunos terão pouco tempo desperdiçado, sem necessidade de desenvolver um app completo para apenas uma atividade ou outra e poderão focar o aprendizado aonde é realmente necessário.

Pra isso funcionar, será necessário que tenhamos acesso aos projetos, para que possamos analisar e inserir uma boas atividades para os projetos.

Para o "Projeto Final" ainda mantém a ideia de criar um novo app para que todos manipulem em diferentes funcionalidades.
Talvez o ideal aqui seja fazer uma simulação completa de um fluxo de trabalho. Eu entendo que nesse momento estamos analisando a capacidade de trabalhar em equipe e também resoluções de gitFlow e não mais questão de capacidade técnica.

Nesse caso, eu sugiro que a última atividade, seja o desenvolvimento de um app completo, que deverá ser feita em uma única entrega por toda a equipe.
Nós elaboramos o conceito e a EF para o desenvolvimento do app e eles, como equipe, deverão dividir e distribuir (com nosso acompanhamento) as tarefas, organizar os conflitos, merges e abrir os PRs ao fim de cada nova funcionalidade do app que for desenvolvida.

Nos dias de aula, durante o Projeto Final, pensei em realizarmos daily meetings, pra tirar dúvidas e acompanhar o andamento do projeto, como jornadeiros.

### Site com APIs gratis para consumo e testes, pode trazer criatividade para as atividades
https://rapidapi.com/collection/list-of-free-apis?utm_source=google&utm_medium=cpc&utm_campaign=1757574668_67679208454&utm_term=free%20api%20for%20testing_b&utm_content=1t1&gclid=Cj0KCQjwrdjnBRDXARIsAEcE5Yl_8Rlg1BP3IO_VXjslf14ChGjxHJ0SiVZXWSKCJddLhPyuVacTQ_MaAi-3EALw_wcB
