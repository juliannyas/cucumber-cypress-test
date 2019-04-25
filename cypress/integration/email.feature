#language:en

@User
Funcionalidade: Realizar o cadastro de um novo usuário no sistema

Desejo cadastrar no sistema
Para usufruir dos recursos do sistema.
		
	Cenario: validar que o campo obrigatório email não foi informado
		Dado a <url> de acesso da primeira etapa
	 	Quando não informar um <email> válido
	 	E clicar no <botão> de registro
	 	Então deve apresentar uma <mensagem>


	Exemplos:
		| url | email | botao| mensagem |
		| "https://qa-web.tilix.com.br/cadastro/etapa-1" | "" | "button.btn.btb-default" | "Campo obrigatório." |

	Cenario: validar a inserção de um email inválido
		Dado a <url> de acesso da primeira etapa
	 	Quando informar um <email> inválido
	 	E clicar no <botão> de registro
	 	Então deve apresentar uma <mensagem>

	Exemplos:
		| url | email | botao| mensagem |
		| "https://qa-web.tilix.com.br/cadastro/etapa-1" | "test" | "button.btn.btb-default" | "E-mail inválido." |

	Cenario: validar a inserção de um email válido
		Dado a <url> de acesso da primeira etapa
	 	Quando informar um <email> válido
	 	E clicar no <botão> de registro
	 	Então deve redirecionar para <urlSegunda>

	Exemplos:
		| url | email | botao| urlSegunda |
		| "https://qa-web.tilix.com.br/cadastro/etapa-1" | "test@tilix.com.br" | "button.btn.btb-default" | "https://qa-web.tilix.com.br/cadastro/etapa-2" |

		