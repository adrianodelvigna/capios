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

Porém, caso você não possa atualizar o seu Xcode, tanto por questões de compatibilidade, ou por alguma outra limitação (como falta de permissão para tanto), você pode configurar o seu Xcode atual para usar um *toolchain* diferente, e experimentar versões diferentes do Swift, tanto mais atual, ou ainda mais antigo, caso seja necessário.

Muito importante enfatizar que usando um *toolchain* diferente (para versões diferentes do Swift daquelas embutidas no Xcode) não necessariamente te permitirá explorar versões diferentes do SDK<sup>1</sup> iOS.

<sup>1</sup> SDK, ou *software development kit* é o conjunto de ferramentas que você usa para desenvoler apps para o iOS, ou o Mac, ou qualquer outra plataforma na verdade. Quando você pensa em SDK no contexto iOS, pense também na versão do iOS que você pode referenciar, iOS 10, 11, 12, 13...

Referências:
- https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/AlternativeToolchains.html

## Keychain

*Keychain*, ou chaveiro, é a solução para armazenamento de dados de forma segura no iOS (e também no Mac, aliás).

Chaveiro talvez não faça justiça do real poder dessa funcionalidade. Talvez a melhor analogia seria com um **cofre**, ou *vault*, em inglês.

Com o Keychain, você pode armazenar senhas, chaves criptográficas, certificados e dados de forma totalmente segura.

Com efeito, o iPhone é referência no mercado, por ser o estado da arte no armazenamento totalmente seguro em *smartphones*.

Referências:
- https://developer.apple.com/documentation/security/keychain_services

## Programação funcional reativa

Vamos quebrar o título dessa seção, em partes:

- Programação: você, programando...
- Funcional: você, programando, usando funções específicas...
- Reativa: você, programando, usando funções específicas, para **reagir**!

Mas... reagir a o que?

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

Qual dessas opções duas, a síncrona e a assíncrona, você acredita possuir a propriedade de aproveitar melhor os recursos disponíveis? <sup>*shh, dica, são os exemplos assíncronos!*</sup>

Com esse modelo, **assíncrono**, agora você pode responder àquela mensagem de Whatsapp enquanto é feito o download do seu podcast. Uepaaa! Devolta às maravilhas da modernidade!

### Observer Pattern

> OK então. Eu já sei como tornar a experiência do usuário do meu app mais agradável e produtiva! Bingo! É o modelo assíncrono, certo?! O app se torna capaz de fazer mais de uma coisa ao mesmo tempo, entendi certo, certo!?

*Você se pega pensando...*

> Isso deve ser moleza! Afinal de contas eu consigo mascar chiclete e caminhar ao mesmo tempo! Eu consigo dirigir e responder ao Facebook ao mesmo tempo! Eu sou multi-tarefa! Eu sou um milennial! Eu nasci nesse mundo! Logo...

*Você se pega pensando, ainda... Claramente vítima do viés cognitivo do [efeito Dunning–Kruger](https://en.wikipedia.org/wiki/Dunning–Kruger_effect) por um breve momento.*

> OK. Moleza. Mãos à obra!

*Abruptamente seu pensamento é interrompido. Ploft! Você observa descrente o cursor piscando na tela, impassível, absolutamente resoluto em sua tarefa de piscar. O Xcode está aberto. Pacientemente aguardando por aquelas linhas de código mágicas, que farão tudo acontecer da forma que você imagina. Você então começa a vislumbrar o infinito e o além.*

Você não sabe por onde começar... Isso deve ser difícil para cara-amba! Programar o seu app para fazer mais de uma coisa ao mesmo tempo!

Primeiro, eu tenho que fazer um ou mais trechos do meu código rodarem de alguma forma paralela. Depois, quando uma ou mais dessas atividades paralelas concluírem, eu preciso coletar o resultado dessas atividades. E além do mais meu app tem que ser bonito e responsivo! Impossível para o prazo que eu tenho!

> Eu deveria mudar minha carreira. Abandonar toda essa porcaria inútil. Talvez estudar letras. Deve ser mais tranquilo, certo? Me tornar escritor? Com meu conhecimento técnico eu poderia escrever alguns artigos, certo? Talvez colocá-los no Github... Hmmmm.

*Passa rapidamente por sua mente...*

Mas você tem um desafio pela frente. Tornar seu app assíncrono! Tal qual o cursor, que resolutamente pisca na tela, cumprindo a tarefa para a qual foi predestinado, você precisa comprir a sua!

E para ajudá-lo(a) na sua tarefa de tornar seu app assíncrono, **respondendo** a múltiplos eventos enquanto ainda permita ao usuário fazer o scroll da tela, ou até mesmo cancelar a tarefa corrente, recorremos ao padrão de desenvolvimento de software *Observer* (do inglês *Observer pattern*).

Não seria legal se houvesse alguém que te dissesse quando uma tarefa foi executada e te notificasse enquanto você realiza outras atividades, em paralelo?

Melhor ainda, se houvesse algo fazer isso para você, no seu app? Eu não quero dizer ao app como fazer as coisas oras! Eu quero dizer o que ele tem que fazer!

Eu quero dizer:

> App, faça essa tarefa e me avise quando terminar. E quando terminar faça isso aqui. Ah! Também, enquanto tudo isso, continue respondendo a toques na tela, scroll e por aí vai, ok? Ok?!

*Continua... no próximo commit.*

### RxSwift

### RxMarbles + Operadores

### Como ler código RxSwift

### Como escrever código RxSwift

### MVVM com RxSwift

### Como ler perguntas e respostas no Stackoverflow!