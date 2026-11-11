# rapidSpot  E3  - Base de dados

Ygor Eto e Lucas Santos

## Ficheiros
- diagrama-er.pdf: diagrama entidade-relação
- modelo-logico.pdf: tabelas, tipos e chaves
- schema.sql: cria a base e as 7 tabelas
- dados.sql: insere os dados de teste
- justificacao.md: normalização e sistema escolhido
- riscos.md: recursos e riscos

## Como recriar a base
Versão usada: MySQL <versão>

1. Correr o schema.sql (apaga a base `rapidspot` se existir e cria-a de novo).
2. Correr o dados.sql.

Pela linha de comandos, dentro da pasta e3/:
mysql -u root -p < schema.sql
mysql -u root -p < dados.sql

No fim do dados.sql há consultas SELECT que mostram os dados, para confirmar que correu bem.