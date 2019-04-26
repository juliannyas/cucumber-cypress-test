#language:pt

@Access
Funcionalidade: Validar dados de acesso

	Como um usuário
	Desejo validar a inserção de dados nos campos Nome, Sobrenome, Celular, Senha e Termos de Uso
	Para garantir a integridade do cadastro de usuário

	Contexto:
		Dado que estou na terceira etapa do cadastro do usuário
	
	@Name @FamilyName
	Cenario: não informar um valor no campo obrigatório nome
	 	Quando não informar um valor no campo nome
	 	Então é apresentado a mensagem Campo obrigatório.

	Cenario: informar um nome com menos 3 caracteres
	 	Quando informar o valor "ju" no campo nome
	 	Então é apresentado a mensagem Deve conter no mínimo 3 caracteres.

	Cenario: não informar um valor no campo obrigatório sobrenome
	 	Quando não informar um valor no campo sobrenome
	 	Então é apresentado a mensagem Campo obrigatório.

	Cenario: informar um sobrenome com menos 3 caracteres
	 	Quando informar o valor "as" no campo sobrenome
	 	Então é apresentado a mensagem Deve conter no mínimo 3 caracteres.

	@NumberCall
	Cenario: não informar um valor no campo obrigatório celular
	 	Quando não informar um valor no campo Celular
	 	Então é apresentado a mensagem Campo obrigatório.

	Cenario: informar um celular no formato inválido
	 	Quando informar o valor "6299381" no campo Celular
	 	Então é apresentado a mensagem Número inválido.

	Cenario: informar um fixo no formato inválido
	 	Quando informar o valor "6299381" no campo Fixo
	 	Então é apresentado a mensagem Número inválido.

@Password
	Cenario: não informar um valor no campo obrigatório senha
	 	Quando não informar um valor no campo "password"
	 	Então é apresentado a mensagem Campo obrigatório.

	Cenario: não informar um valor no campo obrigatório confirmação de senha
	 	Quando não informar um valor no campo confirmação de senha
	 	Então é apresentado a mensagem Campo obrigatório.

	Cenario: visualizar a senha informada
	 	Quando informar o valor "pass" no campo senha
	 	E clicar em "Ver"
	 	Então é apresentado o valor "pass" no campo senha

	Cenario: visualizar a barra de força da senha
	 	Quando informar o valor "Pass123Word!" no campo senha
	 	Então é apresentado a mensagem forte

	Cenario: informar uma confirmação de senha diferente da senha de acesso
	 	Quando informar o valor "Pass123Word!" no campo senha
	 	E informar o valor "PassWord" no campo confirmação de senha
	 	Então é apresentado a mensagem Senha e confirmar senha não conferem.

	Cenario: verificar aceite dos termos de uso e politica de privacidade
	 	Quando clicar em FINALIZAR CADASTRO
	 	Então é apresentado a mensagem Para continuar com o cadastro, deve aceitar os termos de uso.