#language:pt

@User
Funcionalidade: Cadastro de Usuário

	Como um usuário
	Desejo cadastrar no TILIX Digital
	Para que possa usufruir dos recursos do sistema

	Cenario: acessar a tela de cadastro
		Dado que estou na "https://qa-web.tilix.com.br"
		Quando clicar em "CADASTRA-SE"
		Então é apresentado a "https://qa-web.tilix.com.br/cadastro/etapa-1"
	
	@Email
	Cenario: não informar um valor no campo obrigatório email
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E não informar um valor no campo "email"
	 	Quando clicar em "EXPERIMENTE GRÁTIS"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar um email no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar o valor "teste@teste" no campo "email"
	 	Quando clicar em "EXPERIMENTE GRÁTIS"
	 	Então é apresentado a mensagem "E-mail inválido."

	Cenario: informar um email já existente
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar o valor "test@test.com" no campo "email"
	 	Quando clicar em "EXPERIMENTE GRÁTIS"
	 	Então é apresentado a mensagem " E-mail já cadastrado, clique aqui para efetuar seu login."

	Cenario: informar um email válido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar o valor "user@tilix.com.br" no campo "email"
	 	Quando clicar em "EXPERIMENTE GRÁTIS"
	 	Então não é apresentado a mensagem "E-mail inválido."

	Cenario: avançar para a tela de dados da empresa na segunda etapa
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar um email válido
		Então é apresentado a "https://qa-web.tilix.com.br/cadastro/etapa-2"

	@Identifier
	Cenario: não informar um valor no campo obrigatório CNPJ/CPF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E não informar um valor no campo "identifier"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar um CNPJ/CPF no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "1234567890123" no campo "identifier"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "CPF/CNPJ inválido."

	Cenario: informar um CNPJ/CPF inválido para a Receita Federal
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "99999999999" no campo "identifier"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "CPF/CNPJ inválido."

	Cenario: informar um CNPJ/CPF já existente
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "15701333000115" no campo "identifier"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem " CNPJ/CPF já cadastrado. Por favor, clique aqui para efetuar seu login."

	Cenario: não habilitar o campo data de nascimento ao informar um CNPJ
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "15745664000157" no campo "identifier"
	 	Então não é apresentado o campo "birth_date"

	Cenario: habilitar o campo data de nascimento ao informar um CPF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "97345747107" no campo "identifier"
	 	Então é apresentado o campo "birth_date"

	@BirthDate
	Cenario: não informar um valor no campo obrigatório data de nascimento
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informei o valor "97345747107" no campo "identifier"
	 	E não informei um valor no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar uma data de nacismento no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informei o valor "97345747107" no campo "identifier"
	 	E informar o valor "1207" no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Data de nascimento inválida."

	Cenario: informar uma data de nacismento válida
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informei o valor "97345747107" no campo "identifier"
	 	E informar o valor "12071996" no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório." no campo UF
	 	E não é apresentado a mensagem "Data de nascimento inválida."

	@State
	Cenario: não informar um valor no campo obrigatório UF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E não informar um valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar uma UF válida
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar um valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então não é apresentado a mensagem "Campo obrigatório."

	Cenario: avançar para a tela de dados de acesso na terceira etapa
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar um CNJP/CFP válido
	 	E informar uma UF
	 	E se identificador ser CPF, informar uma data de nascimento
	 	Quando clicar em "CONTINUAR CADASTRO"
		Então é apresentado a "https://qa-web.tilix.com.br/cadastro/etapa-2"

	@Access
	Cenario: não informar um valor no campo obrigatório UF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E não informar um valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar uma UF válida
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar um valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então não é apresentado a mensagem "Campo obrigatório."
