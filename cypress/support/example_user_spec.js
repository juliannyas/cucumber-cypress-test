describe('Cadastro de Usuario', function () {
  	
	it('Acesso a tela de cadastro de usuário', function(){
		cy.visit('/')
		cy.location('pathname').should('eq', '/login')
		cy.get('.info-before-login > a').click()
		cy.location('pathname').should('eq', '/cadastro/etapa-1')
	})


	context('Validações do campo Email', function(){

		it('Não informar um email', function(){
			cy.get('#email').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar um email inválido', function(){
			cy.get('#email').clear().type('test@test')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('E-mail inválido.')
		})

		it('Informar um email já existente', function(){
			cy.get('#email').clear().type('test@test.com')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('E-mail já existente.')
		})

		it('Informar um email válido', function(){
			cy.get('#email').clear().type('test2@test.com')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('E-mail já existente.')
			cy.location('pathname').should('eq', '/cadastro/etapa-2')
		})
	})

	context('Validações do campo CNPJ/CPF', function(){

		it('Não informar um CNPJ/CPF', function(){
			cy.get('#identifier').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar um CNPJ/CPF no formato inválido', function(){
			cy.get('#identifier').clear().type('1234567890123')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("CPF/CNPJ inválido.")
		})

		it('Informar um CNPJ/CPF inválido para a Reeita Federal', function(){
			cy.get('#identifier').clear().type('99999999999')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("CPF/CNPJ inválido.")
		})

		it('Informar um CNPJ/CPF já existente', function(){
			cy.get('#identifier').clear().type('15701333000115')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("CPF/CNPJ inválido.")
		})

		it('Não habilitar o campo data de nascimento ao informar um CNPJ', function(){
			cy.get('#identifier').clear().type('15745664000157')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("CPF/CNPJ inválido.")
			cy.get('input').should('not.have.id', 'birth_date')
		})

		it('Habilitar o campo data de nascimento ao informar um CPF', function(){
			cy.get('#identifier').clear().type('97345747107')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("CPF/CNPJ inválido.")
			cy.get('input').should('have.id', 'birth_date')
		})
	})

	context('Validações do campo Data de Nascimento', function(){

		it('Não informar uma Data de Nascimento', function(){
			cy.get('#birth_date').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar uma Data de Nascimento inválida', function(){
			cy.get('#birth_date').clear().type('1234')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Data de nascimento inválida.')
		})

		it('Informar uma Data de Nascimento válida', function(){
			cy.get('#birth_date').clear().type('12071996')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').should('not.have.value', 'Data de nascimento inválida.')
		})
	})

	context('Validações do campo UF', function(){

		it('Não informar uma UF', function(){
			cy.get('#state').select('')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar uma UF válida', function(){
			cy.get('#state').select('GO').should('have.value', 'GO')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
			cy.location('pathname').should('eq', '/cadastro/etapa-3')
		})
	})

	context('Validações dos dados de acesso', function(){

		it('Não informar um Nome', function(){
			cy.get('#name').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar um Nome com pelo menos 3 caracteres', function(){
			cy.get('#name').type('ju')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("Deve conter no mínimo 3 caracteres.")
		})

		it('Não informar um Sobrenome', function(){
			cy.get('#family_name').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar um Sobrenome com pelo menos 3 caracteres', function(){
			cy.get('#family_name').type('ju')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains("Deve conter no mínimo 3 caracteres.")
		})

		it('Não informar um telefone Celular', function(){
			cy.get('#phone_number').type('')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Informar um telefone Celular inválido', function(){
			cy.get('#phone_number').type('123456')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Número inválido.')
		})

		it('Não informar uma Senha de acesso', function(){
			cy.get('input.form-control').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Não informar uma confirmação de Senha', function(){
			cy.get('input#confirm_password.form-control').type(' ')
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Campo obrigatório.')
		})

		it('Visualizar a senha informada', function(){
			cy.get('input.form-control').type('12345')
			cy.get('a.VuePassword_Toggle').click()
			cy.get('input.form-control').should('have.value', '12345')
		})

		it('Visualizar a barra de força da senha', function(){
			cy.get(svg.VuePassword_Meter).should('be.visible') 
		})

		it('Informar uma Senha de acesso fraca', function(){
			cy.get('input.form-control').type('pass')
			cy.get('div.VuePassword__Message.VuePassword--very-weak').should('be.visible') 
		})

		it('Informar uma confirmação de Senha diferente da Senha de acesso', function(){
			cy.get('input.form-control').type('pass')
			cy.get('input#confirm_password.form-control').type('word')
			cy.get('p.text-danger').contains('Senha e confirmar senha não conferem.')
		})

		it('Verificar aceite dos termos de uso e politica de privacidade', function(){
			cy.get('button.btn.btn-default').click()
			cy.get('p.text-danger').contains('Para continuar com o cadastro, deve aceitar os termos de uso.')
		})


		it('Informar dados de acessos válidos', function(){
			cy.get('#name').clear().type('Test')
			cy.get('#family_name').clear().type('BDD')
			cy.get('#phone_number').clear().type('62996694556')
			cy.get('input.form-control').clear().type('passwordtest10')
			cy.get('input#confirm_password.form-control').clear().type('passwordtest10')
			cy.get('span.checkmark').click()
			cy.get('button.btn.btn-default').click()
			cy.location('pathname').should('eq', '/cadastro/etapa-4')	
		})

		it('Valida cadastro de usuário logando no sistema', function(){
			cy.visit('/')
			cy.location('pathname').should('eq', '/login')
			cy.get('#email').type(email)
			cy.get('#password').type(password)
			cy.get(button).click()
			cy.get('div.alert').should('note.have.class', 'alert-danger')
			cy.location('pathname').should('eq', '/cadastro/etapa-4')	
		})
	})
})