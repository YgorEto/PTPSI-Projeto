1.Requisitos funcionais
Comuns a todos os utilizadores
.RF01. O sistema deve permitir o registo de novos utilizadores.

.RF02. O sistema deve permitir o login e o logout.

.RF03. O sistema deve mostrar a cada utilizador apenas a área correspondente ao seu perfil (cliente ou administrador).
-------------//-------------//-------------//-------------

Cliente
.RF04. O cliente deve ver num mapa a localização do parque.

.RF05. O cliente deve consultar o número de vagas livres do parque.

.RF06. O cliente deve poder reservar uma vaga.

.RF07. O cliente deve poder consultar as suas reservas e cancelar uma reserva ativa.

.RF08. O cliente deve ver o preço da diária antes de confirmar a .reserva.

.RF09. A aplicação deve mostrar ao cliente um QR code de acesso quando este chega ao local com uma reserva válida.

.RF10. O cliente deve poder consultar o seu histórico de reservas e estacionamentos.
-------------//-------------//-------------//-------------
Administrador
.RF11. O administrador deve poder definir a lotação do parque.

.RF12. O administrador deve poder definir o preço da diária.

.RF13. O administrador deve poder consultar todas as reservas.

.RF14. O administrador deve ver a ocupação do parque em tempo real.

.RF15. O administrador deve poder consultar o registo de entradas e saídas.
-------------//-------------//-------------//-------------
Cancela simulada
.RF16. A cancela deve validar o QR code apresentado e só abrir se a reserva for válida.

.RF17. A cancela deve registar cada entrada e cada saída, com data e hora.

.RF18. O número de vagas livres deve ser atualizado a cada entrada, saída, reserva e cancelamento.
-------------//-------------//-------------//-------------
2- Regras de negócio
RN01. Vagas livres = lotação − veículos dentro do parque − reservas ativas.

.RN02. Não é possível reservar quando não há vagas livres.

.RN03. Duas pessoas não podem reservar a última vaga em simultâneo; .apenas uma reserva é aceite.

.RN04. Uma reserva que não é usada dentro do prazo definido expira e liberta a vaga.

.RN05. Cada QR code só é válido para a reserva a que pertence e para uma entrada.

.RN06. Apenas o administrador pode alterar a lotação e o preço da diária.
-------------//-------------//-------------//-------------
3- Requisitos não funcionais
.RNF01. Acesso online: o sistema deve estar publicado num endereço .público.

.RNF02. Responsividade: a interface deve funcionar em telemóvel e em computador.

.RNF03. Segurança: as palavras-passe devem ser guardadas de forma cifrada e o acesso às áreas deve ser controlado por perfil.

.RNF04. Proteção de dados: devem ser guardados apenas os dados pessoais necessários ao serviço, em linha com o RGPD.

.RNF05. Usabilidade: o fluxo de consultar vagas, reservar e obter o QR code deve ser simples e curto.

.RNF06. Acessibilidade: a interface deve ter contraste adequado e textos legíveis.

.RNF07. Fiabilidade: a contagem de vagas deve manter-se coerente mesmo com vários utilizadores a usar o sistema ao mesmo tempo.

.RNF08. Manutenção: o código e o script da base de dados devem estar versionados no repositório da equipa.
-------------//-------------//-------------//-------------
4- Stakeholders

Clientes (condutores)

Interesse: saber se há vaga, reservar e entrar com facilidade.
Papel no projeto: utilizadores principais da aplicação.
-------------//-------------//-------------//-------------
Dono ou gestor do parque

Interesse: controlar a lotação, o preço da diária e os acessos, com informação fiável.
Papel no projeto: utilizador administrador e principal fonte de requisitos. [nome e função da pessoa de contacto, a preencher]
-------------//-------------//-------------//-------------
Equipa de desenvolvimento

Interesse: entregar um sistema funcional, publicado e bem documentado.
Papel no projeto: [elemento 1] e [elemento 2], responsáveis por todo o projeto.
-------------//-------------//-------------//-------------
Docente da unidade curricular

Interesse: avaliar a evolução do projeto e a aprendizagem da equipa.
Papel no projeto: avalia as seis entregas e o teste escrito.
-------------//-------------//-------------//-------------
Entidades de alojamento e serviços externos (mapa, alojamento)

Interesse: uso dos seus serviços dentro dos limites gratuitos ou contratados.
Papel no projeto: fornecem a infraestrutura onde o sistema fica publicado.