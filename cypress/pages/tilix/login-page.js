const EMAIL = '#email';
const PASSWORD = '#password';
const FORGOT_PASSWORD = 'a[class=lost-pass]';
const FORGOT_TEXT = 'Não lembra a senha?';
const SHOW_PASSWORD = 'i[class=fa-eye]';
const BTN_REGISTER = 'a';
const REGISTER_TEXT = 'CADASTRE-SE.';
const BTN_LOGIN = '#btn_login';
const LOGIN_TEXT = 'ENTRAR';


class LoginPage {
  
  static visit(url) {
    cy.visit(url);
  }

  static typeEmail(query) {
    cy.get(EMAIL)
      .type(query);
  }

  static typePassword(query) {
    cy.get(PASSWORD)
      .type(query);
  }

  static pressShowPassword() {
    cy.get(SHOW_PASSWORD)
      .click();
  }

  static pressForgotPassword() {
    cy.get(FORGOT_PASSWORD)
      .contains(FORGOT_TEXT)
      .click();
  }

  static pressRegister() {
    cy.get(BTN_REGISTER)
      .contains(REGISTER_TEXT)
      .click();
  }

  static pressLogin() {
    cy.get(BTN_LOGIN)
      .contains(LOGIN_TEXT)
      .click();
  }
}

export default LoginPage;