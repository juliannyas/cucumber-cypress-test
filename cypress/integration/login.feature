#language: en

@Login
Feature: Logging on to the system

	As a system user
	I want to log in to validate user registration

	Scenario Outline: Log in to the system
		Given I open the <url>
		When I enter a valid <email> and <password>
		And Access the system by clicking the login
		Then I open the home page

	Examples:
		| url | email | password | 
		| "https://qa-web.tilix.com.br/" | " " | "test123" |
		| "https://qa-web.tilix.com.br/" | "test@test.com" | " " |
		| "https://qa-web.tilix.com.br/" | " " | "test123" |
		| "https://qa-web.tilix.com.br/" | "test@test.com" | "password14" |