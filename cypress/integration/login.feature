#language: en

@Login
Feature: Logging on to the system

	To validate authentication on the system
	As a system user
	I want to log in to validate user registration

	Scenario Outline: Log in to the system
		Given I open the <url>
		When I enter a valid <email> and <password>
		Then Access the system by clicking the <button>

	Examples:
		| url | email | password | button |
		| "https://qa-web.tilix.com.br/" | "test@tilix.com.br" | "test123" | "#btn_login" |
