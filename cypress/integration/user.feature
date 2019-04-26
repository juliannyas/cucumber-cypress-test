#language: en

@User
Feature: User Registration

    As a user
    I want to subscribe to TILIX Digital
    So you can take advantage of system resources
    
    Scenario Outline: Create a new user on the tilix system
        Given I am on the login page <url>
        When to click on REGISTER
        Then the first stage of registration
        Given that I am in the first stage of registration
        When entering the value <email> in the field
        When you click on TRY FREE
        Then the second stage of registration
        Given that I am in the second stage of registration
        When entering the value <identifier> in the cpf field
        Then the date of birth field is displayed
        When you enter the value <birth_date> in the date field of birth
        When you select the value <state> in the UF field
        When you click CONTINUE REGISTRATION
        Then the third stage of registration
        Given that I am in the third stage of the cadastre
        When you enter the value <name> in the Name field
        When entering the value <family_name> in the last name field
        When entering the value <phone_number> in the cell field
        When you enter the value <passoword> in the Password field
        When you enter the value <confirm_password> in the password confirmation field
        When you accept the terms of use and privacy
        When you click FINISH REGISTRATION
        Then the fourth stage of registration

    Examples:
        | url | email | identifier | birth_date | state | name | family_name | phone_number | passoword | confirm_password |
        | "https://qa-web.tilix.com.br" | "user@tilix.com.br" | "97345747107" | "12071996" | "GO" | "Julianny" | "Alves" | "62993814546" | "Pass123Word123" | "Pass123Word123" |