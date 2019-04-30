Feature: Cadastro de usuário

	Como um usuário
	Desejo cadastrar no TILIX Business
	Para que possa usufruir dos recursos do sistema.

	Background: 
		Given que esteja na tela de cadastro

	Scenario: Deixar de informar um email 
		When não informar um valor no campo email
		Then alerta que o campo é obrigatório

    Scenario: Informar um email inválido
        When informar um email diferente do formato padrão
        Then alerta que o email é inválido
    
    Scenario: Informar um email já cadastrado
        When informar um email já cadastrado no sistema
        Then alerta que o email já está cadastrado, Then clique para logar

    Scenario: Informar um email válido e prosseguir para a segunda etapa
        When informar um email válido e que não esteja cadastrado
        When clicar em experimente grátis
        Then redireciona para a segunda etapa do cadastro
    
    Scenario: Deixar de informar um CNPJ/CPF
        When não informar um valor no campo CNPJ/CPF
        Then alerta que o campo é obrigatório

    Scenario: Informar um CNPJ/CPF inválido
        When informar um identificador diferente da quantidade de digito padrão
        Then alerta que o CNPJ/CPF é inválido

    Scenario: Informar um CNPJ/CPF não válido na receita federal
        When informar um identificador inválido
        Then alerta que o CNPJ/CPF é inválido
    
    Scenario: Informar um CNPJ/CPF já cadastrado
        When informar um identificador já cadastrado no sistema
        Then alerta que o CNPJ/CPF já está cadastrado, Then clique para logar
    
    Scenario: Habilitar o campo data de nascimento
        When informar um identificador do tipo CNPJ
        Then não habilita o campo data de nascimento
        When informar um identificador do tipo CPF
        Then habilita o campo data de nascimento

    Scenario: Deixar de informar uma data de nascimento
        When não informar um valor no campo data de nascimento
        Then alerta que o campo é obrigatório

    Scenario: Informar uma data de nascimento inválida
        When infomar uma data de nascimento diferente do formato padrão
        Then alerta que a data de nascimento é inválida

    Scenario: Deixar de informar o UF
        When não informar um valor no campo UF
        Then alerta que o campo é obrigatório

    Scenario: Informar dados da empresa válidos e prosseguir para a terceira etapa
        When informar um identificador válido
        When informar uma data de nascimento válida
        When informar uma UF válida
        When clicar em continuar cadastro
        Then redireciona para a terceira etapa do cadastro

    Scenario: Deixar de informar um nome
        When não informar um valor no campo nome
        Then alerta que o campo é obrigatório

    Scenario: Informar um nome com menos de três caracteres
        When informar um nome com menos de três caracteres
        Then alerta que nome deve conter no minimo 3 caracteres

    Scenario: Deixar de informar um sobrenome
        When não informar um valor no campo sobrenome
        Then alerta que o campo é obrigatório

    Scenario: Informar um sobrenome com menos de três caracteres
        When informar um sobrenome com menos de três caracteres
        Then alerta que sobrenome deve conter no minimo 3 caracteres

    Scenario: Deixar de informar um contato
        When não informar um valor no campo celular
        Then alerta que o campo é obrigatório

    Scenario: Informar um contato inválido
        When infomar um número celular diferente do formato padrão
        Then alerta que número é inválido

    Scenario: Deixar de informar uma senha
        When não informar um valor no campo senha
        Then alerta que o campo é obrigatório

    Scenario: Deixar de informar uma confirmação de senha
        When não informar um valor no campo confirmação de senha
        Then alerta que o campo é obrigatório

    Scenario: Visualizar a senha informada
        When clicar no ícone no formato de um olho
        Then desmascara o valor do campo senha

    Scenario: Visualizar a barra de força da senha
        When informar um valor no campo senha
        Then deverá ser carregada a barra de força da senha
    
    Scenario: Informar uma senha fraca
        When informar uma senha de facil acerto
        Then alerta que a força da senha é fraca

    Scenario: Informar valores divergentes nos campos senha e confirmação de senha
        When informar um senha diferente da sua confirmação
        Then alerta que a senha e confirmação não conferem.

    Scenario: Deixar de informar o aceite dos termos de uso e politica de privacidade
        When deixar de marcar o aceite aceite dos termos
        Then alerta que para continuar o cadastro deve aceitar os termos de uso.

    Scenario: Informar dados de acesso válidos e prosseguir para a quarta etapa
        When informar um nome válido
        When informar um sobrenome válido
        When informar um numéro de celular válido
        When informar uma senha válida
        When informar uma confirmação válida
        When aceitar os termos de usos e politica de privacidade
        When clicar em finalizar cadastro
        Then redireciona para a quarta etapa do cadastro para validar o usuário

    Scenario: Validar o cadastro de usuário logando no sistema
        Dado que esteja na tela de login
        When informar um email e senha válidos
        When clicar em entrar
        Then redireciona para a tela inicial do sistema