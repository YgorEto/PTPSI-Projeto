# Justificação da Normalização

**Normalização.** O nosso modelo está em terceira forma normal (3FN). Os atributos são simples e cada tabela tem uma chave primária de uma só coluna, por isso não há dependências parciais. Cada dado fica guardado num só sítio: o código da empresa está só na tabela empresa, e os dados de login (nome, email, palavra-passe) estão só na tabela utilizador, com um campo perfil para condutor ou administrador. Assim, mudar o código ou um email altera uma só linha.

**Chaves.** A tabela condutor liga utilizador e estacionamento, porque é uma relação N:M. A senha e o pedido_outra_vaga têm chave própria, porque o mesmo condutor pode receber ou recusar a mesma vaga noutro dia.

**Sistema de gestão.** Escolhemos o MySQL, como prevíamos na E1. Já conhecemos um pouco, aplica as chaves estrangeiras e liga-se facilmente ao PHP, que vamos usar no backend.

**Limitação.** Cada estacionamento tem só um administrador. Se for preciso mais, criamos uma tabela de ligação.
