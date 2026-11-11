# rapidSpot · Recursos e riscos (atualizado em E3)

## 1. Recursos

| Recurso | O que usamos | Notas |
|---|---|---|
| Equipa | Ygor Eto (250000805) e Lucas Santos (250000815) | Só duas pessoas; ambas respondem pelo projeto. |
| Divisão (cronograma) | **Ygor:** modelo ER e lógico, ecrãs do condutor, testes móvel/PC, ligação dos ecrãs à API, relatório e apresentação. **Lucas:** SQL e dados de teste, ecrãs do administrador, API, QR/senha/cancela simulada, publicação. | Vem do `CronogramaGanttRapidSpot.xlsx`. |
| Base de dados | MySQL | Aplica chaves estrangeiras; é o sistema previsto na E1. |
| Backend | PHP | Liga-se ao MySQL; usado em E5. |
| Frontend e design | HTML, CSS, JavaScript, Bootstrap; Figma | Protótipo em 390 px (telemóvel, condutor) e 1440 px (PC, administrador). |
| Modelação | draw.io (diagrama ER), documento do modelo lógico | Exportados para PDF. |
| Versionamento | Git e GitHub, pasta `e3/` | Um commit por alteração ao modelo, com mensagem a dizer o que mudou e porquê. |
| Dados de teste | Escritos com apoio de IA e revistos pela equipa | 2 empresas, 8 utilizadores, 2 estacionamentos, 8 vagas, 7 senhas, 2 pedidos. |
| Alojamento | Serviço gratuito, a escolher antes da E6 | A E1 exige o sistema publicado num endereço público. |
| Tempo | Pouco tempo por semana | O cronograma tem quase todas as datas "A definir"; só a E6 está fixada (5 jan 2027). |

## 2. Riscos

Probabilidade e impacto: **B** = baixo, **M** = médio, **A** = alto.

### 2.1 Riscos do modelo de dados

| # | Risco | Prob. | Imp. | Mitigação |
|---|---|:-:|:-:|---|
| R1 | **Alterar o modelo depois de começar o backend (E5)** obriga a refazer código. | A | A | As decisões da secção 3 ficam tomadas agora. Qualquer alteração passa por diagrama, schema e dados antes de mexer no PHP. |
| R2 | **`vaga.estado` pode ficar desatualizado.** Guardamos o estado na vaga para saber logo as vagas livres, sem ter de percorrer as senhas todas. O preço é ter de o manter certo. | M | A | Atualizar `senha` e `vaga.estado` na mesma transação. Testar entrada sem saída. |
| R3 | **Dois carros recebem a mesma vaga** (critério de sucesso da E1). | M | A | No PHP, escolher e marcar a vaga numa só transação, bloqueando a linha (`SELECT ... FOR UPDATE`). |
| R4 | **A base aceita uma senha com vaga de outro estacionamento** que não o do condutor. | M | M | Validar no backend antes de inserir. |
| R5 | **`id_administrador` pode apontar para um utilizador com perfil `condutor`.** | B | M | Validar o perfil no backend ao criar o estacionamento. |
| R6 | **`senha.codigo` não é único**: dois condutores podem ter o mesmo código ao mesmo tempo. | M | M | Gerar o código no backend e verificar se já existe uma senha válida com ele. |
| R7 | **Cada estacionamento tem só um administrador.** | B | B | Limitação assumida na justificação. Se for preciso mais, cria-se uma tabela de ligação. |
| R8 | **O formato do código da empresa não é imposto pela base.** O ecrã diz "6 a 16 letras maiúsculas ou algarismos, sem espaços", mas o schema só tem `VARCHAR(16)`. | M | B | Validar o formato no backend antes de guardar. |
| R9 | **Retirar uma vaga com histórico falha.** A E1 deixa o administrador "tirar vagas livres", mas `senha` e `pedido_outra_vaga` apontam para a vaga. | A | M | Nesta versão só se retiram vagas sem histórico. Ver L7. |

### 2.2 Riscos de segurança e dados pessoais

| # | Risco | Prob. | Imp. | Mitigação |
|---|---|:-:|:-:|---|
| R10 | **Palavras-passe em texto simples.** | B | A | Guardar só o hash (`password_hash` do PHP, `VARCHAR(255)`). Dados de teste com hashes de exemplo. |
| R11 | **Dados pessoais a mais (RGPD).** | M | M | Guardar só o necessário (nome e email). Não guardamos a matrícula (ver L4). Dados de teste fictícios. |
| R12 | **Injeção de SQL** nos formulários. | M | A | Consultas preparadas (PDO) em todo o PHP. |
| R13 | **Recuperação de palavra-passe mal feita.** Os ecrãs "Enviar link" precisam de um token com validade. Um token guardado em claro ou sem prazo é uma falha de segurança. | M | A | Guardar só o hash do token, com prazo e uso único. Ver L5. |
| R14 | **O código da empresa é partilhado fora da empresa.** Quem o tiver regista-se nela. | M | M | O administrador muda o código (`codigo_atualizado_em` regista quando). Quem já está dentro sai com a senha que recebeu (regra da E1). |

### 2.3 Riscos do negócio (E1)

| # | Risco | Prob. | Imp. | Mitigação |
|---|---|:-:|:-:|---|
| R15 | **A cancela é simulada.** | A | M | Assumido no âmbito. Mostrar na demonstração que a lógica (validação, entrada, saída, lotação) é a real. |
| R16 | **A vaga dada pode não ser onde o condutor estaciona**, porque não há sensores. | A | M | O condutor pode pedir outra vaga, e o administrador pode corrigir o estado à mão. A lotação total não depende disto, porque conta só entradas e saídas. |
| R17 | **O condutor não carrega em nenhuma opção de confirmação.** | M | B | Aceite na primeira versão (decisão da E1). |
| R18 | **Há mais senhas válidas do que vagas livres** (a senha vale 15 minutos antes de ser usada). | M | M | Com o parque cheio, a app não gera senhas novas e a cancela não abre, mesmo para quem já tinha uma. Testar este caso. |
| R19 | **A empresa demora a dar o código novo aos funcionários**, que ficam sem acesso. | M | B | Fora do nosso controlo. A app pede o novo código antes de dar a senha. |

## 3. O que E1 e E2 revelaram

Comparámos os requisitos de E1 e os ecrãs de E2 com o schema. A lotação, as entradas e saídas, o login e o código da empresa já estão cobertos. O ecrã "Entradas e saídas" (data, hora, tipo, vaga) bate certo com a tabela `senha`.

### 3.1 Mudanças ao modelo pedidas pelo professor

- Saíram as tabelas `cancela` e `movimento`. As entradas e saídas veem-se pelas senhas já usadas (`usada_em` preenchido).
- A senha passou a guardar a vaga dada (`id_vaga`), que fica vazia até a senha ser lida.
- Saiu a tabela `administrador`. Condutores e administradores estão todos na tabela `utilizador`, com um campo `perfil`.
- A tabela `condutor` passou a ligar `utilizador` e `estacionamento` (relação N:M).

### 3.2 Decisões sobre as diferenças

| # | De onde vem | Diferença | Decisão |
|---|---|---|---|
| L1 | E1 essencial e E2 (botões Subir/Descer) | **Ordem das vagas.** A E1 diz "pela ordem definida pela empresa", mas só há `piso` e `numero`. | A vaga dada é a primeira livre por piso e número. Os botões Subir/Descer saem do protótipo. |
| L2 | E1 (dois tipos de estacionamento) | **Parque privado.** `estacionamento.id_empresa` é `NOT NULL`. | Nesta versão só há parques de empresa. O parque privado fica para depois. |
| L3 | E1 e E2 ("Estacionei noutra vaga") | **Vaga onde o condutor realmente estacionou.** `senha` só guarda a vaga dada. | Não se guarda. Se a vaga não serve, o condutor faz um pedido de outra vaga, e o administrador corrige o estado à mão. |
| L4 | E2 (Painel e Gerir vagas do administrador) | **Matrícula.** Aparece nos ecrãs, mas não existe em nenhuma tabela. A E1 exclui a leitura de matrículas. | A matrícula sai dos ecrãs. |
| L5 | E2 (recuperar palavra-passe) | **Tabela de recuperação.** Os ecrãs "Enviar link" não têm onde guardar o token. Não está em nenhum requisito de E1. | Fica para a E5. Se houver tempo, cria-se uma tabela (hash do token, validade, uso). Se não, os ecrãs saem. |
| L6 | E1 (três perfis) | **Administrador da app.** `perfil` só tem `condutor` e `administrador`. | O administrador da app trabalha direto na base de dados. O modelo fica como está. |
| L7 | E1 (tirar vagas livres) | **Retirar vaga com histórico** falha (ver R9). | Só se retiram vagas sem histórico. Uma coluna `ativa` fica como melhoria para a E5. |
| L8 | E1 desejável ("a app pede o novo código") | **Código da empresa alterado.** Não se guarda quando o condutor associou a empresa. | Fica fora desta versão (é um requisito desejável). |
| L9 | E2 (pedir outra vaga) | **`pedido_outra_vaga`.** O ecrã não pergunta o motivo, mas `motivo` é `NOT NULL`, e nenhum ecrã do administrador usa `estado`. | O ecrã passa a pedir o motivo. O administrador vê os pedidos "por analisar" e marca-os como analisados. |
| L10 | E1 desejável e E2 (Gerir vagas) | **Corrigir o estado de uma vaga à mão.** No ecrã não há botão para mudar o estado. | Não afeta o modelo (`vaga.estado` já existe). Acrescenta-se o botão ao protótipo. |

### 3.3 Contradições entre documentos

| # | Assunto | E1 | E2 / cronograma | Decisão |
|---|---|---|---|---|
| C1 | Senha de saída | Sai-se com o **mesmo** QR e senha da entrada. | A saída tem uma **senha diferente**. | Segue a E2: uma senha por entrada e outra por saída (`tipo`). A regra da E1 fica corrigida. |
| C2 | Validade da senha | **15 minutos** para entrar. | **5 minutos** ("Válido 4:59" e cronograma). | Fica **15 minutos**, como na E1. Corrige-se o ecrã. Não se guarda na base: calcula-se a partir de `criada_em`. |
