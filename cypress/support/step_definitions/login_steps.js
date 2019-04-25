Given(`I open the {string}`, (url) => {
    cy.visit(url)
 })

When(`I enter a valid {string} and {string}`, (email, password) => {
	cy.get('#email').type(email)
	cy.get('#password').type(password)
})


Then(`Access the system by clicking the {string}`, button => {
	cy.get(button).click()
	cy.get('div.alert').should('note.have.class', 'alert-danger')
})
