import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import LoginPage from '../../../pages/tilix/login-page';

Given(`I open the {string}`, (url) => {
    LoginPage.visit(url);
 })

When(`I enter a valid {string} and {string}`, (email, password) => {
	LoginPage.typeEmail(email);
	LoginPage.typePassword(password);
})


Then(`Access the system by clicking the {string}`, button => {
	LoginPage.pressLogin();
	cy.get('div.alert').should('note.have.class', 'alert-danger')
})
