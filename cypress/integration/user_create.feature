#language:pt

@User
Funcionalidade: Cadastro de Usuário

	Como um usuário
	Desejo cadastrar no TILIX Digital
	Para que possa usufruir dos recursos do sistema

	Cenario: acessar a tela de cadastro
		Dado que estou na "https://qa-web.tilix.com.br"
		Quando clicar em "CADASTRE-SE"
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
	 	Então é apresentado a mensagem "E-mail já cadastrado, clique aqui para efetuar seu login."

	Cenario: informar um email válido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar o valor "user@tilix.com.br" no campo "email"
	 	Quando clicar em "EXPERIMENTE GRÁTIS"
	 	Então não é apresentado a mensagem "E-mail inválido."

	@User @Company
	Cenario: avançar para a tela de dados da empresa na segunda etapa
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-1"
	 	E informar o email válido
	 	Quando clicar em "CADASTRE-SE"
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
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então não é apresentado o campo "birth_date"

	Cenario: habilitar o campo data de nascimento ao informar um CPF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "97345747107" no campo "identifier"
	 	Então é apresentado o campo "birth_date"

	@BirthDate
	Cenario: não informar um valor no campo obrigatório data de nascimento
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "97345747107" no campo "identifier"
	 	E não informar um valor no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar uma data de nacismento no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "97345747107" no campo "identifier"
	 	E informar o valor "1207" no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Data de nascimento inválida."

	Cenario: informar uma data de nacismento válida
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor "97345747107" no campo "identifier"
	 	E informar o valor "12071996" no campo "birth_date"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então não é apresentado a mensagem "Data de nascimento inválida."

	@State
	Cenario: não informar um valor no campo obrigatório UF
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E não informar um valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar uma UF válida
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o valor no campo "state"
	 	Quando clicar em "CONTINUAR CADASTRO"
	 	Então não é apresentado a mensagem "Campo obrigatório."

	@User @Access
	Cenario: avançar para a tela de dados de acesso na terceira etapa
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-2"
	 	E informar o CNJP/CFP válido
	 	E informar uma UF válida
	 	E se identificador ser CPF, informar uma data de nascimento válida
	 	Quando clicar em "CONTINUAR CADASTRO"
		Então é apresentado a "https://qa-web.tilix.com.br/cadastro/etapa-3"

	@Name @FamilyName
	Cenario: não informar um valor no campo obrigatório nome
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E não informar um valor no campo "name"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar um nome com menos 3 caracteres
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "ju" no campo "name"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Deve conter no mínimo 3 caracteres."

	Cenario: não informar um valor no campo obrigatório sobrenome
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E não informar um valor no campo "family_name"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar um sobrenome com menos 3 caracteres
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "as" no campo "family_name"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Deve conter no mínimo 3 caracteres."

	@NumberCall
	Cenario: não informar um valor no campo obrigatório celular
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E não informar um valor no campo "mobile_number"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: informar um celular no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "6299381" no campo "mobile_number"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Número inválido."

	Cenario: informar um celular válido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "62993814546" no campo "mobile_number"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então não é apresentado a mensagem "Número inválido."

	Cenario: informar um fixo no formato inválido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "6299381" no campo "phone_number"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Número inválido."

	Cenario: informar um fixo válido
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "62993814546" no campo "phone_number"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então não é apresentado a mensagem "Número inválido."

	@Password
	Cenario: não informar um valor no campo obrigatório senha
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E não informar um valor no campo "password"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: não informar um valor no campo obrigatório confirmação de senha
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E não informar um valor no campo "confirmed_password"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Campo obrigatório."

	Cenario: visualizar a senha informada
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "pass" no campo "password"
	 	Quando clicar em "Ver"
	 	Então é apresentado o valor "pass" no campo "password"

	Cenario: visualizar a barra de força da senha
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "Pass123Word!" no campo "password"
	 	Então é apresentado a mensagem "good"

	Cenario: informar uma confirmação de senha diferente da senha de acesso
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "Pass123Word!" no campo "password"
	 	E informar o valor "PassWord" no campo "confirmed_password"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Senha e confirmar senha não conferem."

	Cenario: verificar aceite dos termos de uso e politica de privacidade
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	Quando clicar em "FINALIZAR CADASTRO"
	 	Então é apresentado a mensagem "Para continuar com o cadastro, deve aceitar os termos de uso."

	@User @Confirmation
	Cenario: avançar para a tela de confirmação de usuário na quarta etapa
		Dado que estou na "https://qa-web.tilix.com.br/cadastro/etapa-3"
	 	E informar o valor "User" no campo "name"
	 	E informar o valor "Test" no campo "family_name"
	 	E informar o valor "62993814546" no campo "mobile_number"
	 	E informar o valor "6235765555" no campo "phone_number"
	 	E informar o valor "Pass123Word123" no campo "password"
	 	E informar o valor "Pass123Word123" no campo "confirmed_password"
	 	E marcar o "checkterm"
	 	Quando clicar em "FINALIZAR CADASTRO"
		Então é apresentado a "https://qa-web.tilix.com.br/cadastro/etapa-4"
