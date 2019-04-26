import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import UserPage from '../../pages/tilix/user-page';
import LoginPage from '../../pages/tilix/login-page';

const INVALID_EMAIL = 'E-mail inválido.';
const EXISTS_EMAIL = 'E-mail já cadastrado, clique aqui para efetuar seu login';

Given('that I am in the first step of the user registry', function () {
    LoginPage.visit(url);
	LoginPage.pressRegister();
	cy.get('p').should('not.have.class', 'text-danger')
	cy.url().should('match', /etapa-1/)
});

When('you do not enter a value in the E-mail field', function () {
	cy.get(WARNING)
	.should('not.contain', EXISTS_FIELD)
});

Then('message Required field is displayed.', function () {
	UserPage.requiredField();
});

When('entering the test@test value in the email field', function () {
	UserPage.typeEmail("test@test");
});

When('you click on TRY FREE', function () {
	UserPage.pressExperiment();
});

Then('Invalid Email appears.', function () {
	cy.get(WARNING)
	.contains(INVALID_EMAIL)
});

When('you enter the value test@test.com in the email field', function () {
	UserPage.typeEmail("test@test.com");
});

Then('the message E-mail already registered is displayed, click here to log in.', function () {
	cy.get(WARNING)
	.contains(EXISTS_EMAIL)
});