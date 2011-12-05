Feature: Updating profile
  In order to have most complete profile
  As a registered demo app member
  I want to update it
  
  Background:
    Given I am a registered demo app member with a partially completed profile
    And I sign-in successfully
    And I am in my profile page
    
    Scenario: Update personal details 
      Then I should see a link to edit my Personal details
      And I should see edit profile page by clicking on link to edit Personal details
      And I fill in relevant personal data and save
      Then I should see updated personal data in my profile page
      
    Scenario: Update Biography 
      Then I should see a link to edit my Biography details  
      And I should see edit profile page by clicking on link to edit Biography details
      And I fill in relevant biography data and save
      Then I should see updated biography data in my profile page
      
    Scenario: New employment link
      Then I should see a link to add new employment details
      
    Scenario: Add employment detail
      When I click on add employment link
      Then I should see a form to enter employment details
      Then I enter relevant employment data and save
      And I should see the added employment data in my profile page
      
    Scenario: Edit employment detail link 
      And I have added multiple employment details 
      Then I should see a link to edit each employment detail
      
    Scenario: Update employment detail
      And I have added employment detail
      And I am in the edit employment detail form by clicking the edit link
      When I update the relevant employment data and save
      Then I should see updated employment data
   
    Scenario: Should be able to cancel updating employment detail
      And I have added employment detail
      And I am in the edit employment detail form by clicking the edit link
      When I update the relevant employment data but cancel saving
      Then I should see unchanged employment data   
      
    Scenario: Should be able to delete employment detail
      And I have added employment detail
      And I am in the edit employment detail form by clicking the edit link
      Then I should see a link to delete currently opened employment data   
      And clicking on delete link removes the employment detail
