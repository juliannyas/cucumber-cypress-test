#language:en

@User
Funcionalidade: Cadastro de Usuário

Como Usuário
Desejo cadastrar no TILIX Business 
Para que possa usufruir dos recursos do sistema

	Cenario: Acessar a tela de cadastro
		Dado o link para acessar o sistema "https://qa-web.tilix.com.br"
		Quando clicar em "CADASTRA-SE."
		Então deve redirecionar para a etapa 1 do cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
		
	Cenario: validar que o campo obrigatório email não foi informado
		Dado o link de acesso da etapa 1 do cadatro "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E não informar um valor no campo email
	 	Quando clicar no botão de experimentação grátis
	 	Então deve apresentar a mensagem "Campo obrigatório."

	Cenario: validar a inserção de um email inválido
		Dado a <url> de acesso da primeira etapa
	 	Quando informar um <email> inválido
	 	E clicar no <botão> de registro
	 	Então deve apresentar uma <mensagem>

	Cenario: validar a inserção de um email válido
		Dado a <url> de acesso da primeira etapa
	 	Quando informar um <email> válido
	 	E clicar no <botão> de registro
	 	Então deve redirecionar para <urlSegunda>


		