@LoginFeature
Feature: Login Feature

  Background: Open the Login Page
    Given User has navigated to the login page

  @Regression @Sanity
  Scenario: Positive Login Scenario
    When User enters correct username and password
    And User clicks on the Login Button
    Then user should be navigated to the Home Page
	
	@Regression
  Scenario: Positive Login Scenatio with Parameters
    When User enters correct username "abc@xyz.com" and password "Abc@12345"
    And User clicks on the Login Button
    Then user should be navigated to the Home Page

  Scenario Outline: Positive Login Scenatio with muliple users
    When User enters correct username "<UserName>" and password "<Password>"
    And User clicks on the Login Button
    Then user should be navigated to the Home Page

    Examples: 
      | UserName    | Password |
      | abc@xyz.com | Abc@1234 |
      | pqr@abc.com | Abc@1234 |

  Scenario Outline: Negative Login Scenatio with muliple users
    When User enters correct username "<UserName>" and password "<Password>"
    And User clicks on the Login Button
    Then user should be getting the error message "<Error>"

    Examples: 
      | UserName    | Password | Error                                              |
      | abc@xyz.com | Abc@1234 | The email or password you have entered is invalid. |
      | pqr@abc.com | Abc@1234 | The email or password you have entered is invalid. |
	
	@DataTable
  Scenario: Positive Login Scenatio with Cucumber DataTable
    When User enters correct credentials
      | Field     | Value       |
      | UserName  | abc@xyz.com |
      | Passoword | Abc@1234    |
    And User clicks on the Login Button
    Then user should be navigated to the Home Page
