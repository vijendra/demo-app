Feature: User profile
  In order to be a demo app research community member
  As a invited interested user
  I want to be able to sign-up and create a profile
  
  Background:
    Given I am in demo app home page
      
  Scenario: Sign-up link
    Then I should see a link to "Sign-up"
    
  Scenario: Sign-up page 
    When I click on "Sign-up" link
    Then I should be in Sign-up page
  
  Scenario: Successful profile creation
    And I click on "Sign-up" link
    And I reach demo app sign-up page
    And I submit the sign-up form with valid relevant data
    Then I should be signed-up successfully
    
  Scenario: Successful sign-in
    And I am a registered demo app member
    And I click on "Login" link
    And I submit the sign-in form with valid credentials
    Then I should be signed_in successfully

  Scenario: Profile link
    And I am a registered demo app member
    When I sign-in successfully
    Then I should see a link to "Profile"
  
  Scenario: Profile page 
    And I am a registered demo app member
    When I sign-in successfully
    And I click on "Profile" link
    Then I should be in my profile page  
