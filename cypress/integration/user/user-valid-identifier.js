import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import UserPage from '../../pages/tilix/user-page';

const BIRTH_DATE = '#birth_date';
const INVALID_BIRTH_DATE = 'Data de nascimento inválida.';
const EXISTS_BIRTH_DATE = 'Data de nascimento';
const EXISTS_IDENTIFIER = 'CNPJ/CPF já existe. Por favor clique aqui para entrar.';
const INVALID_IDENTIFIER = 'CNPJ/CPF inválido.';

When('you do not enter a value in the CNPJ/CPF field', function () {
	UserPage.typeIdentifier(null);
});

When('entering the value {int} in the field CNPJ/CPF', function (identifier) {
	UserPage.typeIdentifier(identifier);
});

Then('the invalid CPF/CNPJ message is displayed.', function () {
	cy.get(WARNING)
	.contains(INVALID_IDENTIFIER);
});

When('entering the value {int} in the CNPJ/CPF field', function (identifier) {
	UserPage.typeIdentifier(identifier);
});

When('entering the value {int} in the CNPJ/CPF field', function (identifier) {
	UserPage.typeIdentifier(identifier);
});

Then('the CNPJ/CPF message already registered is displayed. Please click here to login.', function () {
	cy.get(WARNING)
	.should('contain', EXISTS_IDENTIFIER);
});

When('entering the value {int} in the CNPJ/CPF field', function (identifier) {
	UserPage.typeIdentifier(identifier);
});

Then('the field Date of Birth', function () {
	cy.get(WARNING)
	.should('contain', EXISTS_BIRTH_DATE);
});

When('you do not enter a value in the Date of Birth field', function () {
	UserPage.typeBirthDate(null);
});

When('you enter the value {int} in the Date of Birth field', function (birth_date) {
	UserPage.typeBirthDate(birth_date);
});

Then('The Invalid Birth Date message is displayed.', function () {
	cy.get(WARNING)
	.contains(INVALID_EBIRTH_DATE);
});

When('you do not enter a value in the UF field', function () {
	UserPage.requiredField();
});