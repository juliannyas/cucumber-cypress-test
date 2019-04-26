import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import LoginPage from '../../pages/tilix/login-page';

Given('I open the {string}', function (url) {
    LoginPage.visit(url);
 });

When('I enter a valid {string} and {string}', function (email, password) {
	LoginPage.typeEmail(email);
	LoginPage.typePassword(password);
});

When('Access the system by clicking the login', function () {
	LoginPage.pressLogin();
});

Then('I open the home page', function () {
	cy.get('p').should('not.have.class', 'text-danger')
});


