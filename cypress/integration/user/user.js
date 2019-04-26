import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import LoginPage from '../../pages/tilix/login-page';
import UserPage from '../../pages/tilix/user-page';

const BIRTH_DATE = 'Data de nascimento';

Given('I am on the login page {string}', function (url) {
    LoginPage.visit(url);
});

When('to click on REGISTER', function () {
	LoginPage.pressRegister();
});

Then('the first stage of registration', function () {
	cy.url()
	.should('match', /etapa-1/);
});

Given('that I am in the first stage of registration', function () {
	cy.url()
	.should('match', /etapa-1/);
});

When('entering the value {string} in the field', function (email) {
	UserPage.typeEmail(email);
});

Then('the second stage of registration', function () {
	cy.url()
	.should('match', /etapa-2/);
});

Given('that I am in the second stage of registration', function () {
	cy.url()
	.should('match', /etapa-2/);
});

When('entering the value {string} in the cpf field', function (identifier) {
	UserPage.typeIdentifier(identifier);
});

Then('the date of birth field is displayed', function () {
	cy.get('label')
	.should('contain', BIRTH_DATE);
});

When('you enter the value {string} in the date field of birth', function (birth_date) {
	UserPage.typeBirthDate(birth_date);
});

When('you select the value {string} in the UF field', function (uf) {
	UserPage.selectState(uf);
});

When('you click CONTINUE REGISTRATION', function () {
	UserPage.pressContinue();
});

Then('the third stage of registration', function () {
	cy.url()
	.should('match', /etapa-3/);
});

Given('that I am in the third stage of the cadastre', function () {
	cy.url()
	.should('match', /etapa-3/);
});

When('you enter the value {string} in the Name field', function (name) {
	UserPage.typeName(name);
});

When('entering the value {string} in the last name field', function (family_name) {
	UserPage.typeFamilyName(family_name);
});

When('entering the value {string} in the cell field', function (phone) {
	UserPage.typePhoneNumber(phone);
});

When('you enter the value {string} in the Password field', function (pass) {
	UserPage.typePassword(pass);
});

When('you enter the value {string} in the password confirmation field', function (confirm_pass) {
	UserPage.typeConfirmPassword(confirm_pass);
});

When('you accept the terms of use and privacy', function () {
	UserPage.checkAgreement();
});

When('you click FINISH REGISTRATION', function () {
	UserPage.pressFinish();
});

Then('the fourth stage of registration', function () {
	cy.url()
	.should('match', /etapa-4/);
});
