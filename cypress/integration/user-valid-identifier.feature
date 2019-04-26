#language: en

@Identifier
Feature: Validate identifier

    As a user
    I wish to validate the insertion of data in the fields CNPJ/CPF, UF and Date of Birth
    To ensure the integrity of the user registry
    
    Background:
    Given that I am in the second stage of registration
    
    Scenario: do not enter a value in the mandatory field CNPJ/CPF
	    When you do not enter a value in the CNPJ/CPF field
	    Then message Required field is displayed.
    
    Scenario: Report a CNPJ/CPF in invalid format
	    When entering the value 1234567890123 in the field CNPJ/CPF
	    Then the invalid CPF/CNPJ message is displayed.
    
    Scenario: Report an invalid CNPJ/CPF to the IRS
	    When entering the value 99999999999 in the CNPJ/CPF field
	    Then the invalid CPF/CNPJ message is displayed.
    
    Scenario: inform an existing CNPJ/CPF
	    When entering the value 15701333000115 in the CNPJ/CPF field
	    Then the CNPJ/CPF message already registered is displayed. Please click here to login.
    
    Scenario: Do ​​not enable the date of birth field when informing a CNPJ
	    When entering the value 15745664000157 in the CNPJ/CPF field
	    Then The date of Birth field is not displayed.
    
    @BirthDate
    Scenario: Enable the date field of birth when entering a CPF
	    When entering the value 97345747107 in the CNPJ/CPF field
	    Then the field Date of Birth
    
    Scenario: do not enter a value in the required field date of birth
	    When you do not enter a value in the Date of Birth field
	    Then The message Required field is displayed.
    
    Scenario: Report a birth date in invalid format
	    When you enter the value 1207 in the Date of Birth field
	    Then The Invalid Birth Date message is displayed.
    
    @State
    Scenario: Do ​​not enter a value in the required UF field
	    When you do not enter a value in the UF field
	    Then The message Required field is displayed.