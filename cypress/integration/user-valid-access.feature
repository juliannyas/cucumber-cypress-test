#language: en

@Access
Feature: Validate access data

	As a user
	I want to validate the data entry in the Name, Last Name, Phone, Password and Terms of Use fields
	To ensure the integrity of the user registry

	Background:
		Given that I am in the third step of the user registry

	@Name @FamilyName
	Scenario: Do ​​not enter a value in the required field name
		When you do not enter a value in the Name field
		Then message Required field is displayed.

	Scenario: Enter a name of at least 3 characters
		When entering the value "ju" in the name field
		Then the message Must contain at least 3 characters.

	Scenario: Do ​​not enter a value in the required field last name
		When you do not enter a value in the last name field
		Then message Required field is displayed.

	Scenario: Enter a last name of at least 3 characters
		When you enter the value "as" in the last name field
		Then the message Must contain at least 3 characters.

	@NumberCall
	Scenario: Do ​​not enter a value in the required mobile field
		When you do not enter a value in the Mobile field
		Then message Required field is displayed.

	Scenario: Report a cell phone in invalid format
		When entering the value "6299381" in the Mobile field
		Then message Invalid Number is displayed.

	Scenario: Report a fixed in invalid format
		When entering the value "6299381" in the Fixed field
		Then message Invalid Number is displayed.

	@Password
	Scenario: Do ​​not enter a value in the required password field
		When not entering a value in the "password"
		Then message Required field is displayed.

	Scenario: Do ​​not enter a value in the required password confirmation field
		When you do not enter a value in the Password Confirmation field
		Then message Required field is displayed.

	Scenario: view the entered password
		When entering the value "pass" in the password field
		And click "View"
		Then the value "pass" is displayed in the password field

	Scenario: view the password strength bar
		When you enter the value "Pass123Word!" in the password field
		Then the strong message is presented

	Scenario: Enter a password confirmation different from the access password
		When you enter the value "Pass123Word!" in the password field
		And enter the value "PassWord" in the password confirmation field
		Then the message Password and confirm password do not match.

	Cenario: Verify acceptance of the terms of use and privacy policy
		When you click FINISH REGISTRATION
		Then the message To continue with the registration, you must accept the terms of use.
