@driver
Feature: Hire End to End

  @Hire_End_to_End @FCB2
  Scenario Outline: Create Position, PreHire and Hire with Job Requisition

    #1.Create Postion with Job Requsition Part Ex:Junior Software Engineer
    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>" "<Position option>"
    And User fills details in the Recruiting Information page
      | Reason                         | Recruiting Instruction |
      | Unplanned New Position > BAU  | Do Not Post            |
    And User fills details in the Job page
    And User fills details in the Skills page
    And User fills details in the Organizations page
    And User fills details in the Attachments page
    And User fills details in the Compensation page
    And User fills details in the Assign Roles page
    And User fills details in the Summary page
    Then User submitted the data successfully
    And User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Created Position and get approved by GFO
    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Created Position and get approved by Manger's Manager
    Then Created Job Position Approved Successfully

    #2.Create Pre-Hire Part Ex:John
    When User create PreHire with "<Task1>" for proxy as "<User3>"
      | Phone Number | Phone Type | State  | Postal Code | Address Type | Email Type |
      | 6123456890   | Home       | Alaska | 99501       | Work         | Home       |
    Then PreHire is created successfully

    #3.Hire Employee Part (Mapping the Person to Position) Ex: John -> Junior Software Engineer
    When User creates hire employee "<Task2>"
    And User provides PreHireID and Initiates hire and submits
      | Supervisory Organization              | Reason                     |
      | West Credit, Uw & Srvcg (Shannon Ortiz) | Hire Employee > New Hire |
    Then Hire With Job Requisition is created successfully

    #4.Approvals Part
    When User Selects MyTasks And Accesses Created Position and submit for Change Organization Assignments
    And User update the salary amount in compensation and submits
    And User submits the Request One-Time Payment

    And User starts proxy as "<User4>"
    When User Selects MyTasks And Accesses Created Position and approve

    And User starts proxy as "<User3>"
    When User Selects MyTasks And Accesses Created Position and submit for HR shared service

    And User starts proxy as "<User5>"
    Then User Selects MyTasks And Accesses Created Position and submit for HR compliance

    #Hire End to End Flow Completed


    Examples:
      | User          | Task                    | Position option     | User1              | User2 | User3       | Task1           | Task2         | User4           | User5         |
      | Shannon Ortiz | Create Job Requisition  | Create New Position | Nadezhda Canuteson | 060016| Traci Lewis | Create Pre-Hire | Hire Employee | Makayla Thrower | Maggie Tanner |