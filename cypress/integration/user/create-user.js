import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import LoginPage from '../../pages/tilix/login-page';
import UserPage from '../../pages/tilix/user-page';

const INVALID_EMAIL = 'E-mail inválido.';
const EXISTS_EMAIL = 'E-mail já cadastrado, clique aqui para efetuar seu login';
const INVALID_BIRTH_DATE = 'Data de nascimento inválida.';
const EXISTS_BIRTH_DATE = 'Data de nascimento';
const EXISTS_IDENTIFIER = 'CNPJ/CPF já existe. Por favor clique aqui para entrar.';
const INVALID_IDENTIFIER = 'CNPJ/CPF inválido.';
const MIN_CHARACTERS = 'Deve conter no mínimo 3 caracteres.';
const INVALID_NUMBER = 'Número inválido.';
const INVALID_PASSWORD = 'Senha e confirmar senha não conferem.';
const INVALID_AGREEMENT = 'Para continuar com o cadastro, deve aceitar os termos de uso.';

Given('que esteja na tela de cadastro', function () {
    LoginPage.visit('https://qa-web.tilix.com.br/');
	LoginPage.pressRegister();
	cy.get('p').should('not.have.class', 'text-danger')
	cy.url().should('match', /etapa-1/)
});

When('não informar um valor no campo email', function () {
	UserPage.typeEmail(null);
});

Then('alerta que o campo é obrigatório', function () {
	UserPage.requiredField();
});

When('informar um email diferente do formato padrão', function () {
	UserPage.typeEmail('test@test');
});

Then('alerta que o email é inválido', function () {
	UserPage.showWarning(INVALID_EMAIL);
});

When('informar um email já cadastrado no sistema', function () {
	UserPage.typeEmail('test@test.com');
});

Then('alerta que o email já está cadastrado, então clique para logar', function () {
	UserPage.showWarning(EXISTS_EMAIL);
});

When('informar um email válido e que não esteja cadastrado', function () {
	UserPage.typeEmail('teste@tilix.com.br');
});

When('clicar em experimente grátis', function () {
	UserPage.pressExperiment();
});

Then('redireciona para a segunda etapa do cadastro', function () {
	cy.url().should('match', /etapa-2/)
});

When('não informar um valor no campo CNPJ\/CPF', function () {
	UserPage.typeIdentifier(null);
});

When('informar um identificador diferente da quantidade de digito padrão', function () {
	UserPage.typeIdentifier('12345');
});

Then('alerta que o CNPJ\/CPF é inválido', function () {
	UserPage.showWarning(INVALID_IDENTIFIER);
});

When('informar um identificador inválido', function () {
	UserPage.typeIdentifier('123456789');
});

When('informar um identificador já cadastrado no sistema', function () {
	UserPage.typeIdentifier('15701333000115');
});

Then('alerta que o CNPJ\/CPF já está cadastrado, então clique para logar', function () {
	UserPage.showWarning(EXISTS_IDENTIFIER);
});

When('informar um identificador do tipo CNPJ', function () {
	UserPage.typeIdentifier('15745664000157');
});

Then('não habilita o campo data de nascimento', function () {
	cy.get(WARNING)
	.should('not.contain', EXISTS_BIRTH_DATE);
});

When('informar um identificador do tipo CPF', function () {
	UserPage.typeIdentifier('97345747107');
});

Then('habilita o campo data de nascimento', function () {
	cy.get(WARNING)
	.should('contain', EXISTS_BIRTH_DATE);
});

When('não informar um valor no campo data de nascimento', function () {
	UserPage.typeBirthDate(null);
});

When('infomar uma data de nascimento diferente do formato padrão', function () {
	UserPage.typeBirthDate('1207');
});

Then('alerta que a data de nascimento é inválida', function () {
	UserPage.showWarning(INVALID_BIRTH_DATE);
});

When('não informar um valor no campo UF', function () {
	UserPage.selectState(null);
});

When('informar um identificador válido', function () {
	UserPage.typeIdentifier('97345747107');
});

When('informar uma data de nascimento válida', function () {
	UserPage.typeBirthDate('12071996');
});

When('informar uma UF válida', function () {
	UserPage.selectState('GO');
});

When('clicar em continuar cadastro', function () {
	UserPage.pressContinue();
});

Then('redireciona para a terceira etapa do cadastro', function () {
	cy.url().should('match', /etapa-3/)
});

When('não informar um valor no campo nome', function () {
	UserPage.typeName(null);
});

When('informar um nome com menos de três caracteres', function () {
	UserPage.typeName('ju');
});

Then('alerta que nome deve conter no minimo {int} caracteres', function (int) {
	UserPage.showWarning(MIN_CHARACTERS);
});

When('não informar um valor no campo sobrenome', function () {
	UserPage.typeFamilyName(null);
});

When('informar um sobrenome com menos de três caracteres', function () {
	UserPage.typeFamilyName('Al');
});

Then('alerta que sobrenome deve conter no minimo {int} caracteres', function (int) {
	UserPage.showWarning(MIN_CHARACTERS);
});

When('não informar um valor no campo celular', function () {
	UserPage.typePhoneNumber(null);
});

When('infomar um número celular diferente do formato padrão', function () {
	UserPage.typePhoneNumber('9938145');
});

Then('alerta que número é inválido', function () {
	UserPage.showWarning(INVALID_NUMBER);
});

When('não informar um valor no campo senha', function () {
	UserPage.typePassword(null);
});

When('não informar um valor no campo confirmação de senha', function () {
	UserPage.typeConfirmPassword(null);
});

When('clicar no ícone no formato de um olho', function () {
	UserPage.pressEye();
});

Then('desmascara o valor do campo senha', function () {
	UserPage.showPassword('SoftwareTest2019');
});

When('informar um valor no campo senha', function () {
	UserPage.typePassword('SoftwareTest2019');
});

Then('deverá ser carregada a barra de força da senha', function () {
	UserPage.showWarning(' ');
});

When('informar uma senha de facil acerto', function () {
	UserPage.typePassword('123');
});

Then('alerta que a força da senha é fraca', function () {
	UserPage.showWarning('');
});

When('informar um senha diferente da sua confirmação', function () {
	UserPage.typeConfirmPassword('123');
});

Then('alerta que a senha e confirmação não conferem.', function () {
	UserPage.showWarning(INVALID_PASSWORD);
});

When('deixar de marcar o aceite aceite dos termos', function () {
	UserPage.pressContinue();
});

Then('alerta que para continuar o cadastro deve aceitar os termos de uso.', function () {
	UserPage.showWarning(INVALID_AGREEMENT);
});

When('informar um nome válido', function () {
	UserPage.typeName('User');
});

When('informar um sobrenome válido', function () {
	UserPage.typeFamilyName('Test');
});

When('informar um numéro de celular válido', function () {
	UserPage.typePhoneNumber('62993814546');
});

When('informar uma senha válida', function () {
	UserPage.typePassword('SoftwareTest2019')
});

When('informar uma confirmação válida', function () {
	UserPage.typeConfirmPassword('SoftwareTest2019');
});

When('aceitar os termos de usos e politica de privacidade', function () {
	UserPage.checkAgreement();
});

When('clicar em finalizar cadastro', function () {
	UserPage.pressFinish();
});

Then('redireciona para a quarta etapa do cadastro para validar o usuário', function () {
	cy.url().should('match', /etapa-4/)
});

Given('que esteja na tela de login', function () {
    LoginPage.visit('https://qa-web.tilix.com.br/');
	LoginPage.pressRegister();
	cy.get('p').should('not.have.class', 'text-danger');
	cy.url().should('match', '/login/');
});

When('informar um email e senha válidos', function () {
	UserPage.typeEmail('teste@tilix.com.br');
	UserPage.typePassword('SoftwareTest2019');
});

When('clicar em entrar', function () {
	LoginPage.pressLogin();
});

Then('redireciona para a tela inicial do sistema', function () {
    LoginPage.visit('https://qa-web.tilix.com.br/');
	LoginPage.pressRegister();
	cy.get('p').should('not.have.class', 'text-danger');
	cy.url().should('match', '/home/');
});