03-Objetivos e ambito

1-Objetivo geral

Criar e publicar online uma aplicação de estacionamento, para parques privados e para empresas, onde o condutor vê a lotação, entra com um QR code ou uma senha e sabe onde estacionar, e o administrador do estacionamento controla as vagas, a ocupação e as entradas e saídas.

-------------//-------------//-------------//-------------

2- Objetivos específicos

- Permitir que o condutor se registe, faça login e veja os estacionamentos e a localização deles.

- Permitir que o condutor preencha no perfil o código da empresa, para usar o estacionamento dela.

- Mostrar a lotação do estacionamento em tempo real.

- Gerar um QR code e uma senha de entrada, que valem 15 minutos para entrar e, depois de entrar, até sair.

- Simular a cancela: ver se o QR code ou a senha são válidos, registar a entrada e a saída e atualizar a lotação.

- Dar a cada carro a primeira vaga livre, pela ordem que a empresa definiu, e mostrar onde estacionar.

- Permitir que o condutor confirme "Estacionei na vaga X" ou "Estacionei noutra vaga", e que peça outra vaga se a dada estiver ocupada.

- Dar ao administrador do estacionamento o controlo das vagas e da ordem delas, da ocupação, das entradas e saídas e do código da empresa.

- Dar ao administrador da app a preparação de cada estacionamento quando a empresa contrata.

- Ter três perfis: condutor, administrador do estacionamento e administrador da app.

- Publicar o sistema num endereço público até 5 de janeiro de 2027.

-------------//-------------//-------------//-------------

3- Âmbito incluído

- Registo e login.

- Três perfis: condutor, administrador do estacionamento e administrador da app.

- Dois tipos de estacionamento: parque privado (qualquer condutor registado) e estacionamento de empresa (só quem tem o código da empresa).

- Ver a lotação e a localização do estacionamento.

- QR code e senha de entrada.

- Cancela simulada, que conta as entradas e saídas.

- Vagas dadas por ordem, definida pela empresa.

- Confirmação do condutor ("Estacionei na vaga X" ou "Estacionei noutra vaga") e pedido de outra vaga.

- Registo das entradas e saídas.

- Área do administrador do estacionamento: vagas, ocupação, entradas e saídas, código da empresa e corrigir o estado de uma vaga.

- Preparação do estacionamento pelo administrador da app (na primeira versão pode ser feita direto na base de dados).

- Sistema publicado num endereço público.

-------------//-------------//-------------//-------------

4- Âmbito excluído

- Cancela e câmara reais: a cancela e a leitura do QR code são simuladas.

- Sensores nas vagas: o sistema não sabe sozinho se uma vaga está ocupada.

- Reservas de vaga.

- Pagamentos e preços.

- Leitura de matrículas.

- Perfil de operador, segurança ou funcionário do estacionamento.

- Aplicação móvel nativa: a aplicação funciona no navegador.

- Mapa do interior do parque: só se sobrar tempo.

-------------//-------------//-------------//-------------

5- Pressupostos e restrições

- A cancela é simulada na app. Na primeira versão não há equipamento real.
- O sistema só sabe o que as entradas, as saídas e as confirmações dos condutores lhe dizem, porque não há sensores nas vagas.
- Cada vaga tem um número, e a ordem em que são dadas é definida pela empresa.
- Cada carro ocupa uma vaga.
- O condutor tem telemóvel com internet.
- Para a demonstração, usamos poucos estacionamentos de teste (um parque privado e uma empresa).
- A primeira versão é pequena para caber em 15 semanas: o que é desejável e opcional só entra se sobrar tempo.

-------------//-------------//-------------//-------------

6- Critérios de sucesso

- Um condutor consegue fazer tudo sem ajuda: registar-se, ver a lotação, entrar, estacionar, confirmar e sair.
- A lotação atualiza-se certa a cada entrada e saída.
- Cada carro recebe a primeira vaga livre pela ordem definida, e dois carros nunca recebem a mesma vaga.
- Quem não tem o código da empresa não entra no estacionamento da empresa.
- Quando o código da empresa muda, quem já está dentro consegue sair, e quem quer entrar tem de pôr o código novo.
- Quando o estacionamento está cheio, a app avisa, não gera QR code nem senha e a cancela não abre.
- O administrador do estacionamento consegue gerir as vagas, ver a ocupação e ver as entradas e saídas.
- O sistema está publicado num endereço público.


