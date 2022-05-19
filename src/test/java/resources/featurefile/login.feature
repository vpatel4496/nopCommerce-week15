Feature: Login Test
  As user I want to login into nop commerce website

@Smoke
  Scenario: User should navigate to login page successfully
    Given I am on homepage
    When  I click on login link
    Then  I should navigate to login page successfully
@Sanity
  Scenario Outline: Verify the error message with invalid credentials
    Given I am on homepage
    When  I click on login link
    And   I enter email "<email>"
    And   I enter password "<password>"
    And   I click on login button
    Then  I should see the error message "<errorMessage>"
    Examples:
      | email              | password | errorMessage                                                                                |
      | sam4567@gmail.com  | Abcd1234 | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | pat197@gmail.com   | Abcd1245 | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | jayveeru@gmail.com | Abc78912 | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |

  @Sanity, @Smoke
  Scenario: User should login successfully with valid credentials
    Given I am on homepage
    When  I click on login link
    And   I enter email "jack988@gmail.com"
    And   I enter password "Xyzabc1234"
    And   I click on login button
    Then  I should see log out link displayed
@Regression
  Scenario: User Should LogOut SuccessFully
    Given I am on homepage
    When  I click on login link
    And   I enter email "jack988@gmail.com"
    And   I enter password "Xyzabc1234"
    And   I click on login button
    And   I click on logout button
    Then  I should see login link displayed "<logInLink>"


