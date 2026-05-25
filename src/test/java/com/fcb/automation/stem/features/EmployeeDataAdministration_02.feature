@driver
Feature: Employee Data Administration

  @HRSTEM-206 @PersonalDataChanges @Positive @FCB2
  Scenario Outline: Associate updates personal data without required documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    Then User updates personal information
      | Gender |
      | Female |
    Then personal information is updated successfully
    And updated personal information is displayed in personal tab

    Examples:
      | User         | Task                           |
      | Anjali Pahuja | Change My Personal Information |

  @HRSTEM-205 @PersonalDataChanges @Positive @FCB2
  Scenario Outline: Associate submits personal data with required documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User "<User>" updates personal information and provides required documentation
      | Description             | Category             |
      | MaritalStatus Document  | Personal Information |
    Then personal data change request is submitted successfully

    Examples:
      | User          | Task                           |
      | Kevin Becker  | Change My Personal Information |

  @HRSTEM-2153 @PersonalDataChanges @Positive
  Scenario Outline: HRSS reviews and approves personal data change

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User2>"
    And HRSS reviews personal data change request and approves the request
    And User starts proxy as "<User3>"
    And User submits all To-Do tasks
    Then personal data change is updated successfully
    And updated personal data change is reflected in the associate profile

    Examples:
      | User2       | User3        |
      | Traci Lewis | Kevin Becker |

  @HRSTEM-2153 @PersonalDataChanges @Negative @FCB2
  Scenario Outline: HRSS reviews and send back personal data change request

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>" "<Position option>"

    And User fills details in the Recruiting Information page
      | Reason                        | Recruiting Instruction |
      | Unplanned New Position > BAU | Do Not Post            |

    And User fills details in the Job page
    And User fills details in the Skills page
    And User fills details in the Organizations page
    And User fills details in the Attachments page
    And User fills details in the Compensation page
    And User fills details in the Assign Roles page
    And User fills details in the Summary page
    Then user submitted the data successfully
    And User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Created Position and get approved by GFO
    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Created Position and get approved by Manger's Manager
    Then Created Job Position Approved Successfully
    When User create PreHire with "<Task1>" for proxy as "<User3>"
      | Phone Number | Phone Type | State  | Postal Code | Address Type | Email Type |
      | 6123456890   | Home       | Alaska | 99501       | Work         | Home       |
    Then PreHire is created successfully
    When User creates hire employee "<Task2>"
    And User provides PreHireID and Initiates hire and submits
      | Supervisory Organization              | Reason                    |
      | Mtg Credit, Uw & Srvcg (Shannon Ortiz) | Hire Employee > New Hire |
    Then Hire With Job Requisition is created successfully
    When User Selects MyTasks And Accesses Created Position and submit for Change Organization Assignments
    And User update the salary amount in compensation and submits
    And User submits the Request One-Time Payment
    And User starts proxy as "<User4>"
    When User Selects MyTasks And Accesses Created Position and approve
    And User starts proxy as "<User3>"
    When User Selects MyTasks And Accesses Created Position and submit for HR shared service
    And User starts proxy as "<User5>"
    When User Selects MyTasks And Accesses Created Position and submit for HR compliance
    When User starts proxy as employee
    And User selects "<Task3>"
    And User updates personal information and provides required documentation
      | Description             | Category             |
      | MaritalStatus Document  | Personal Information |
    Then personal data change request is submitted successfully
    When User starts proxy as "<User3>"
    And HRSS reviews the task provides "<Comment>" and send back the request
    Then Event sent back message is displayed

    Examples:
      | User          | Task                   | Position option     | User1              | User2 | User3       | Task1           | Task2         | User4           | User5         | Task3                           | Comment       |
      | Shannon Ortiz | Create Job Requisition | Create New Position | Nadezhda Canuteson | 060016 | Traci Lewis | Create Pre-Hire | Hire Employee | Makayla Thrower | Maggie Tanner | Change My Personal Information | Data Mismatch |