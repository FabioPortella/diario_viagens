# Avaliação - Projeto diario_viagens

### Instituto Federal de São Paulo - campus Barretos

### Pós-Graduação lato senso em Programação para Internet e Dispositivos Móveis

### Desenvolvimento para Dispositivos Móveis II

## Introdução

Nesta avaliação, você deverá desenvolver um aplicativo para ser utilizado como um diário de viagens, de acordo com as especificações e restrições listadas neste documento.

## Forma de Avaliação

A avaliação levará em consideração as seguintes características do aplicativo desenvolvido:

• Correto atendimento do aplicativo em relação às especificações fornecidas neste documento;

• Utilização correta dos conceitos trabalhados na disciplina;

• Funcionamento correto, eficiente e seguro do aplicativo desenvolvido;

• Correta explanação dos conceitos utilizados no aplicativo;

• Correta explanação do funcionamento do aplicativo.


## Formação de Grupos

Esta avaliação pode ser feita de forma individual ou em grupo de, no máximo, três discentes, a critério dos discentes.

## Material a ser entregue

Deverão ser entregues o código-fonte de dois aplicativos, um desenvolvido utilizando o framework React Native e outro utilizando o framework Flutter. Ambos aplicativos possuem as mesmas características, sendo diferenciados no framework utilizado para sua escrita. Também deverá ser entregue um relatório, explicando as diferenças que o grupo encontrou no desenvolvimento utilizando as diferentes linguagens, bem como as suas vantagens e as desvantagens no desenvolvimento do aplicativo proposto.

## Data de Entrega

O prazo máximo para a entrega do material solicitado é o dia 06/dez/2023 às 23:59.

## Forma de Entrega

A entrega deverá ser realizada em atividade cadastrada no Moodle institucional, disponível em https://moodle.brt.ifsp.edu.br/. O código-fonte deve estar em repositório público no GitLab ou GitHub, sendo o seu endereço informado no Moodle institucional.

## 1 Descrição geral do aplicativo

O aplicativo a ser desenvolvido nesta avaliação deve ser utilizado pelos seus utilizadores de forma a registrar diários de viagens, de forma a permitir uma fácil visualização destes dados ao utilizar o aplicativo.

## 2 Requisitos Funcionais

Os requisitos funcionais descrevem o comportamento do aplicativo e estão listados aqui em ordem aleatória. Todo o comportamento descrito aqui é obrigatório e deve ser realizado. Incrementos podem ser feitos, a critério do(s) discente(s), desde que não alterem o comportamento dos requisitos.

### 2.1 RF01 - Tela inicial

A tela inicial do aplicativo deve exibir as viagens já cadastradas bem como as em processo de cadastro de forma diferenciada. A forma como a diferenciação será realizada ficará a cargo dos desenvolvedores. Também deve exibir uma opção para cadastro de nova viagem (ver RF02), bem como edição e exclusão de viagens já cadastradas (ver RF04 e RF05).

### 2.2 RF02 - Cadastro de nova viagem

Cada viagem deve conter dados referentes às datas e locais visitados. A forma como os dados serão coletados ficará a critério dos desenvolvedores. Cada diário de uma viagem deve contar com uma ou mais entradas (ver RF03).

### 2.3 RF03 - Entrada de diário

Para cada viagem, é possível informar diversas entradas em um diário, informando datas e locais visitados, bem como uma descrição da atividade realizada e arquivos de mídia referentes àquela entrada. A forma como os dados serão coletados ficará a critério dos desenvolvedores.

### 2.4 RF04 - Edição de viagem

Viagens já cadastradas podem ser alteradas em todos os seus dados. No entanto, para que possa ser feita a alteração dos dados, é obrigatório que o usuário realize, com sucesso, uma autenticação local, que ficará a critério dos desenvolvedores.

### 2.5 RF05 - Remoção de viagem

Viagens já cadastradas podem ser removidas. No entanto, para que essa operação possa ser feita, é obrigatório que o usuário realize, com sucesso, uma autenticação local, que ficará a critério dos desenvolvedores.

### 2.6 RF06 - Visualização de viagem

Viagens já cadastradas devem possuir uma opção para que o usuário possa visualizar as entradas em ordem cronológica.

## 3 Requisitos Não Funcionais

Os requisitos não funcionais descrevem qualidades e características do aplicativo. Todas os requisitos não funcionais descritos aqui são obrigatórios e devem ser cumpridos no desenvolvimento do aplicativo.

### 3.1 RNF01 - Plataforma e uso esperado do sistema

O aplicativo deve ser desenvolvido em duas versões, uma utilizando o framework Flutter e outra utilizando o framework React Native. Todas as tecnologias utilizadas devem ser gratuitas, sendo ambos aplicativos capazes de serem executados em smartphones Android (a partir da versão 12) e iOS (a partir da versão 13).

### 3.2 RNF02 - Facilidade de uso

O aplicativo deve possuir interface com o usuário amigável e de fácil utilização. As decisões a serem tomadas para a construção da interface e a coleta dos dados devem sempre considerar a usabilidade do aplicativo e a satisfação do usuário. Uma vez na tela inicial do aplicativo, espera-se que usuários não gastem mais que 2 toques para iniciar um cadastro, 5 toques para realizar uma remoção, 3 toques parar iniciar uma atualização e 2 toques para iniciar uma visualização.
