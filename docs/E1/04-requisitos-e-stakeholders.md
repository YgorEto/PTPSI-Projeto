04-Requisitos e Stakeholders

1.Requisitos funcionais

Os requisitos estão separados por prioridade: Essenciais, Desejáveis e Opcionais.

Essenciais

Comuns

- O sistema deve permitir o registo de novos utilizadores.
- O sistema deve permitir login e logout.
- Cada utilizador só vê a área do seu perfil (condutor, administrador do estacionamento ou administrador da app).

Condutor

- O condutor deve poder pôr o código da empresa no perfil.
- O condutor deve ver os estacionamentos e escolher um.
- O condutor deve ver a lotação do estacionamento.
- O condutor deve poder carregar em "Entrar no estacionamento" e receber um QR code e uma senha. Se estiver cheio, a app avisa e não gera QR code nem senha.
- A app deve mostrar ao condutor a vaga onde deve estacionar.
- O condutor deve poder confirmar "Estacionei na vaga X" ou "Estacionei noutra vaga" (escolhendo qual). Este ecrã fica no perfil até ele sair.
- O condutor deve poder sair com o mesmo QR code ou a mesma senha da entrada.

Administrador do estacionamento

- O administrador deve poder gerir as vagas: acrescentar vagas, tirar vagas livres e mudar a ordem.
- O administrador deve ver a ocupação em tempo real.

Cancela simulada

- A cancela deve ver se o QR code ou a senha são válidos e só abrir se o estacionamento não estiver cheio.
- A cancela deve registar cada entrada e cada saída, com data e hora.
- A cancela deve dar ao carro a primeira vaga livre pela ordem definida e mostrar onde estacionar.
- A lotação deve atualizar a cada entrada e a cada saída.

-------------//-------------//-------------//-------------

Desejáveis

Condutor

- No estacionamento de empresa, a app deve ver se o código da empresa no perfil está certo. Se a empresa mudou o código, a app pede o novo antes de dar o QR code.
- O condutor deve poder pedir outra vaga se a dada estiver ocupada ou sem acesso.
- O condutor deve ver a localização do estacionamento.

Administrador do estacionamento

- O administrador deve poder ver o registo de entradas e saídas.
- O administrador deve poder mudar o código da empresa.
- O administrador deve poder mudar à mão o estado de uma vaga (livre ou ocupada).

Administrador da app

- O administrador da app deve poder preparar um estacionamento quando a empresa contrata: criar o estacionamento, marcar as vagas e a ordem, criar a conta do administrador do estacionamento e o código da empresa. Na primeira versão pode ser feito direto na base de dados.

-------------//-------------//-------------//-------------

Opcionais

- Em estacionamentos grandes, o condutor deve poder ver um mapa com o caminho da cancela até à vaga.
- O condutor deve poder ver o histórico das suas entradas.

-------------//-------------//-------------//-------------

2- Regras de negócio

- A lotação é o número de vagas do estacionamento. Cada vaga está livre ou ocupada.
- Se não há vagas livres, ninguém entra: a app avisa que está cheio, não gera QR code nem senha e a cancela não abre.
- Dois carros não podem receber a mesma vaga.
- O QR code e a senha valem 15 minutos para entrar. Depois de entrar, valem até o condutor sair. Servem só para uma entrada e uma saída.
- No parque privado entra qualquer condutor registado. No estacionamento de empresa só entra quem tem o código da empresa certo no perfil.
- Cada empresa tem um só código. Só o administrador do estacionamento o muda. Quem já está dentro não é afetado e sai com o QR code ou a senha que recebeu.
- As vagas são dadas por ordem, definida pela empresa. Se uma vaga fica livre pelo meio, o próximo carro que entrar recebe essa vaga.
- Uma vaga volta a ficar livre quando o carro a que o sistema a deu sai. Se foi marcada como ocupada porque o condutor pediu outra vaga, só fica livre quando o administrador do estacionamento a liberta.
- Se o condutor escolhe "Estacionei noutra vaga", a vaga escolhida fica ocupada por ele e a vaga que lhe foi dada fica livre. Se a vaga escolhida já está ocupada, a app avisa e pede para escolher outra.
- Só o administrador do estacionamento muda as vagas e a ordem, e só pode tirar vagas que estejam livres.
- Só o administrador da app prepara os estacionamentos e cria as contas dos administradores.

-------------//-------------//-------------//-------------

3- Requisitos não funcionais

- Online: o sistema deve estar publicado num endereço público.
- Responsivo: deve funcionar no telemóvel e no computador.
- Segurança: as palavras-passe devem ficar guardadas cifradas e cada perfil só acede à sua área.
- Proteção de dados: guardar só os dados pessoais necessários, de acordo com o RGPD.
- Fácil de usar: entrar, receber a vaga e sair deve ser simples e rápido.
- Acessibilidade: contraste adequado e textos fáceis de ler.
- Fiabilidade: a lotação e o estado das vagas devem ficar certos mesmo com várias pessoas a usar ao mesmo tempo.
- Manutenção: o código e o script da base de dados devem estar no repositório da equipa.

-------------//-------------//-------------//-------------

4- Stakeholders

Condutores (normais e de empresa)

- Interesse: saber se há vaga, entrar com facilidade e saber onde estacionar.
Papel no projeto: utilizadores principais da aplicação.


Dono ou gestor do parque, ou empresa dona do estacionamento

- Interesse: controlar as vagas, a lotação e quem entra, com informação certa.
Papel no projeto: contrata o serviço, usa o perfil de administrador do estacionamento e é a principal fonte de requisitos. [nome e função da pessoa de contacto, a preencher]


Administrador da app

- Interesse: preparar cada estacionamento de forma simples quando a empresa contrata.
Papel no projeto: prepara as vagas, a ordem e as contas dos administradores.



Entidades de alojamento e serviços externos (alojamento, mapa)

- Interesse: uso dos seus serviços dentro dos limites gratuitos ou contratados.
Papel no projeto: dão o espaço onde o sistema fica publicado.


-------------//-------------//-------------//-------------

5- Riscos

- A cancela é simulada na app, não é equipamento real.
- A vaga dada pode não ser onde o condutor estaciona, porque o sistema só sabe a vaga que deu. Para ajudar, o condutor pode confirmar onde estacionou ou pedir outra vaga, e o administrador pode corrigir uma vaga à mão. A lotação total não depende disto, porque conta só entradas e saídas.
- O condutor pode não carregar em nenhuma das opções de confirmação. Aceitamos este risco na primeira versão.
- O QR code vale 15 minutos antes de ser usado, por isso pode haver mais QR codes do que vagas livres. Quando o estacionamento está cheio, a app não gera mais QR codes e a cancela não abre, mesmo para quem já tinha um QR code válido.
- A empresa pode demorar a dar o código novo aos funcionários, que ficam sem acesso ao estacionamento da empresa até o terem.