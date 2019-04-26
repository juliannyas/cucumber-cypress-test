const EMAIL = '#email';
const IDENTIFIER = '#identifier';
const BIRTH_DATE = '#birth_date';
const STATE = '#state';
const NAME = '#name';
const FAMILY_NAME = '#family_name';
const PHONE_NUMBER = '#phone_number';
const LANDLINE_NUMBER = '#landline_number';
const PASSWORD = 'input[type=password]';
const CONFIRM_PASSWORD = '#confirm_password';
const AGREEMENT = '#agreement';
const BTN_NEXT = 'button[type=submit]';
const EXPERIMENT_TEXT = 'EXPERIMENTE GRÁTIS';
const CONTINUE_TEXT = 'CONTINUAR CADASTRO';
const FINISH_TEXT = 'FINALIZAR CADASTRO';

class UserPage {
  
  static visit(url) {
    cy.visit(url);
  }

  static typeEmail(query) {
    cy.get(EMAIL)
      .type(query);
  }

  static typeIdentifier(query) {
    cy.get(IDENTIFIER)
      .type(query);
  }

  static typeBirthDate(query) {
    cy.get(BIRTH_DATE)
      .type(query);
  }

  static typeState(query) {
    cy.get(STATE)
      .type(query);
  }

  static typeName(query) {
    cy.get(NAME)
      .type(query);
  }

  static typeFamilyName(query) {
    cy.get(FAMILY_NAME)
      .type(query);
  }

  static typePhoneNumber(query) {
    cy.get(PHONE_NUMBER)
      .type(query);
  }

  static typeLandlineNumber(query) {
    cy.get(LANDLINE_NUMBER)
      .type(query);
  }

  static typePassword(query) {
    cy.get(PASSWORD)
      .type(query);
  }

  static typeConfirmPassword(query) {
    cy.get(CONFIRM_PASSWORD)
      .type(query);
  }

  static checkAgreement() {
    cy.get(AGREEMENT)
      .click();
  }

  static pressExperiment() {
    cy.get(BTN_NEXT)
      .contains(EXPERIMENT_TEXT)
      .click();
  }

  static pressContinue() {
    cy.get(BTN_NEXT)
      .contains(CONTINUE_TEXT)
      .click();
  }

  static pressFinish() {
    cy.get(BTN_NEXT)
      .contains(FINISH_TEXT)
      .click();
  }
}

export default UserPage;