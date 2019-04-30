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
const WARNING_FIELD = 'p[class=text-danger]';
const REQUIRED_FIELD = 'Campo obrigatório.';

class UserPage {
  
  static visit(url) {
    cy.visit(url);
  }

  static typeEmail(query) {
    cy.get(EMAIL)
      .clear()
      .type(query);
  }

  static typeIdentifier(query) {
    cy.get(IDENTIFIER)
      .clear()
      .type(query);
  }

  static typeBirthDate(query) {
    cy.get(BIRTH_DATE)
      .clear()
      .type(query);
  }

  static selectState(query) {
    cy.get(STATE)
      .select(query);
  }

  static typeName(query) {
    cy.get(NAME)
      .clear()
      .type(query);
  }

  static typeFamilyName(query) {
    cy.get(FAMILY_NAME)
      .clear()
      .type(query);
  }

  static typePhoneNumber(query) {
    cy.get(PHONE_NUMBER)
      .clear()
      .type(query);
  }

  static typeLandlineNumber(query) {
    cy.get(LANDLINE_NUMBER)
      .clear()
      .type(query);
  }

  static typePassword(query) {
    cy.get(PASSWORD)
      .clear()
      .type(query);
  }

  static typeConfirmPassword(query) {
    cy.get(CONFIRM_PASSWORD)
      .clear()
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

  static requiredField() {
    cy.get(WARNING_FIELD)
    .contains(REQUIRED_FIELD)
  }

  static showWarning(warning) {
    cy.get(WARNING_FIELD)
    .contains(warning)
  }
}

export default UserPage;