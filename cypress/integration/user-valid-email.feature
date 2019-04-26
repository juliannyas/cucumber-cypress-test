#language: en

@Email
Feature: Validate emails

	As a user
	I want to validate the insertion of data in the email field
	To ensure the integrity of the user registry

	Background:
	    Given that I am in the first step of the user registry

	Scenario: Do ​​not enter a value in the required email field
		When you do not enter a value in the E-mail field
		When you click on TRY FREE
		Then message Required field is displayed.

	Scenario: Inform an email in invalid format
		When entering the test@test value in the email field
		When you click on TRY FREE
		Then Invalid Email appears.

	Scenario: inform an existing email
		When you enter the value test@test.com in the email field
		When you click on TRY FREE
		Then the message E-mail already registered is displayed, click here to log in.