1-Objetivo geral

Desenvolver e publicar online uma aplicação de estacionamento privado que permita ao cliente consultar as vagas livres, reservar lugar e entrar no parque com um QR code, e que dê ao administrador o controlo da lotação, do preço da diária e dos registos de acesso.
-------------//-------------//-------------//-------------

2- Objetivos específicos
.Permitir que o cliente se registe, faça login e veja a localização do parque num mapa.

.Mostrar o número de vagas livres em tempo real.

.Permitir ao cliente fazer e consultar reservas de vaga.

.Gerar um QR code de acesso que o cliente apresenta à cancela.

.Simular a cancela: validar o QR code, registar a entrada e a saída e 
atualizar as vagas livres.

.Dar ao administrador as ferramentas para definir a lotação, definir o preço da diária, consultar reservas, ver a ocupação em tempo real e consultar os registos de entrada e saída.

.Distinguir dois perfis (cliente e administrador) com permissões diferentes.

.Publicar o sistema num endereço público até 5 de janeiro de 2027.
-------------//-------------//-------------//-------------

3- Âmbito incluído
.Aplicação com registo e login de utilizadores.

.Dois perfis: cliente e administrador.

.Mapa com a localização do parque.

.Consulta de vagas livres, calculadas a partir da lotação, dos veículos dentro do parque e das reservas ativas.

.Reserva de vaga num parque.

.QR code de acesso apresentado pela aplicação.

.Cancela simulada, que controla as vagas livres pela contagem de entradas e saídas.

.Registo de entradas e saídas na base de dados.

.Área do administrador com gestão de lotação e preço da diária, consulta de reservas, ocupação em tempo real e registos de entrada e saída.

.Sistema alojado e acessível num endereço público.

-------------//-------------//-------------//-------------
4- Âmbito excluído
.Cancela e câmara reais: a cancela e a leitura do QR code são simuladas, sem qualquer hardware físico.

.Pagamentos reais: o preço da diária é definido e apresentado ao cliente, mas não há cobrança.

.Vários parques: o sistema trata um único parque, embora a estrutura de dados possa ficar preparada para crescer.

.Perfil de operador ou funcionário: ficam apenas cliente e administrador.

.Leitura automática de matrículas.

.Aplicação móvel nativa: a aplicação é acedida pelo navegador, com interface responsiva.

-------------//-------------//-------------//-------------
5- Pressupostos e restrições

.A equipa tem no máximo dois elementos e mantém-se até ao fim.
.O projeto decorre em cerca de 15 semanas, com seis entregas intermédias.
.Os dois elementos são trabalhadores-estudantes e têm disponibilidade limitada, por isso o âmbito foi mantido reduzido.
.Um sistema pequeno a funcionar vale mais do que um grande a meio, por isso as funcionalidades excluídas só entram se sobrar tempo.

-------------//-------------//-------------//-------------

6- Critérios de sucesso
.Um cliente consegue, do registo à entrada, completar o fluxo de reserva e acesso sem ajuda.
.O número de vagas livres atualiza-se corretamente após cada reserva, entrada e saída.
.Duas pessoas não conseguem reservar a última vaga ao mesmo tempo.
.O administrador consegue consultar reservas, ocupação e registos de acesso.
.O sistema está publicado e acessível num endereço público.
.Cada elemento da equipa sabe explicar todo o projeto no teste escrito de 7 de janeiro.

-------------//-------------//-------------//-------------