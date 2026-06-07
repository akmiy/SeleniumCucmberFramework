@driver
Feature: Employee

  Scenario Outline: Employee Details

    #Login
    Given user launches application
    When user performs login
    Then login should be successful

    #New Employee Creation
    When user creates employee "<firstname>" "<lastname>" "<employeeId>"
    Then employee should be created successfully

     #Employee Details Update
    When user performs login
    And search created employee
    And user fills contact details
      | Address      | City    | State  | ZipCode | Country | Mobile     | WorkEmail         |
      | Chennai Road | Chennai | TamilN | 600001  | India   | 9876543210 | asif@test.com     |

    Examples:
      | firstname   | lastname | employeeId |
      | Yasmin      | Khan     | 3001       |
