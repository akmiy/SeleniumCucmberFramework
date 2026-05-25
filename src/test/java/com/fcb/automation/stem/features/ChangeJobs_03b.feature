@driver
Feature: Change Jobs Lateral Move


  @HRSTEM-241 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario Outline: Manager initiates Lateral Move Change Job for Associate

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
      | Supervisory Organization               | Reason                    |
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
    #Creating Position
    When User starts proxy as "<User6>" and selects "<Task5>"
    And User selects prepopulated Position popup and submits
    And User provides Supervisory Organization details in the create position Information page
      | Position Request Reason      | Job Posting Title |
      | Unplanned New Position > BAU | Governance        |
    And User Provides details in Hiring Restriction
      | Job Profile                             | Location             | Time Type | Worker Type | Worker Sub-Type |
      | 1586HR - Senior Compliance Analyst HR | FL0675-Coral Springs | Full time | Employee    | Regular         |
    Then User submits all details successfully
    When User Selects MyTasks And Accesses Created Job Position For Submit
    And User starts proxy as "<User8>"
    And User Selects MyTasks And Accesses Created Job Position And Get Approved By GFO
    And User starts proxy as "<User7>"
    And User Selects MyTasks And Accesses Created Job Position And Get Approved By Manger's Manager
    Then Created Job Position Approved Successfully

    When User starts proxy as "<User>" and selects "<Task4>"
    And User start Job Change for worker and "Lateral Move"
    And User provides details in the lateral Move page
    Then User verifies Lateral Move is Completed Successfully


    Examples:
      | User          | Task                   | Position option     | User1              | User2 | User3       | Task1           | Task2         | User4           | User5         | User6 | Task5              | User7 | User8 | Task4             |
      | Shannon Ortiz | Create Job Requisition | Create New Position | Nadezhda Canuteson | 060016 | Traci Lewis | Create Pre-Hire | Hire Employee | Makayla Thrower | Maggie Tanner | 070636 | Create Position | 060104 | 048749 | Start Job Change |



  @HRSTEM-242 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario Outline: Verify proposed Manager submits Change Job without entering any Comments

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Lateral Move and get approved by Manager
    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Lateral Move and get approved by Manager's Manager
    Then change job request is routed to HRBP successfully

    Examples:
      | User1 | User2 |
      | 048749 | 042280 |

  @HRSTEM-247 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario Outline: HRBP reviews and approves change job request for change type

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Lateral Move and get approved by HR
    Then Lateral Move process completed Successfully

    Examples:
      | User1         |
      | Kristi Newton |



  @HRSTEM-241 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario Outline: Manager initiates Other Job Change for Associate

    Given User logged into workday HCM Core as "Associate"

    When User starts proxy as "<User>" and selects "<Task>"
    And User start Job Change for "<Worker>" and "Other Job Change"

    And User Provides new Job profile "<Position>"

    Then user verifies Change In Other Job Change is Completed successfully

    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Other Job Change For Approve By Manager's Manager

    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Other Job Change For Approve By HR

    Then change job request is routed to compensation partner successfully


    Examples:
      | User   | Task             | Worker   | Position                                 | User1 | User2         |
      | 070636 | Start Job Change | Todd Ngo | 0551 - Manager Regional Security Services | 060104 | Kristi Newton |



  @HRSTEM-248 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario Outline: Validate compensation partner approves additional compensation request

    Given User logged into workday HCM Core as "Associate"

    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Other Job Change For Approve By Compensation Partner

    Then Change Jobs Other Job Change Approved Successfully


    Examples:
      | User1 |
      | 066829 |



  @test @FCB2
  Scenario Outline: Change Jobs Promotion for Associate

    Given User logged into workday HCM Core as "Associate"

    When User starts proxy as "<User>" and selects "<Task>"
    And User start Job Change for "<Worker>" and "Promotion"

    And User Provides new Job profile "<Position>"

    Then user verifies Change In Promotion is Completed successfully

    And User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Promotion For Approve By Manager

    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Promotion For Approve By Manager's Manager

    Then Change Jobs Promotion Approved Successfully


    Examples:
      | User                  | Task             | Worker    | Position             | User1 | User2         |
      | Randy Martin (050921) | Start Change Job | Jill Hardy | 1813 - Manager Audit | 060104 | Kristi Newton |



  @HRSTEM-241 @AssociateMovement(ChangeJob) @Positive @FCB2
  Scenario : Manager initiates transfer to new manager Change Job for Associate

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
      | Supervisory Organization               | Reason                    |
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

    When User starts proxy as "<User6>" and selects "<Task5>"
    And User selects prepopulated Position popup and submits

    And User provides Supervisory Organization details in the create position Information page
      | Position Request Reason      | Job Posting Title |
      | Unplanned New Position > BAU | Governance        |

    And User Provides details in Hiring Restriction
      | Job Profile                             | Time Type | Worker Type | Worker Sub-Type |
      | 1586HR - Senior Compliance Analyst HR | Full time | Employee    | Regular         |

    Then User submits all details successfully

    When User Selects MyTasks And Accesses Created Job Position For Submit

    And User starts proxy as "<User8>"
    And User Selects MyTasks And Accesses Created Job Position And Get Approved By GFO

    And User starts proxy as "<User7>"
    And User Selects MyTasks And Accesses Created Job Position And Get Approved By Manger's Manager

    Then Created Job Position Approved Successfully

    When User starts proxy as "<User>" and selects "<Task4>"
    And User start Job Change for worker and "Transfer to new manager"

    And User provides details in the Transfer to new manager page

    Then User verifies Transfer to new manager is Completed Successfully