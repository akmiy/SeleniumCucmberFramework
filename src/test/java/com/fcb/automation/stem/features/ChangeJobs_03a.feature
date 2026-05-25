@driver
Feature: Change Jobs


  @HRSTEM-251 @AssociateMovement(ChangeJob-fromTalentAcquisition) @Positive @FCB2
  Scenario Outline: HR Shared Services Tier 2 initiates job change request for change type

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User initiates work data change request for an "<Worker>" and "Change Location"
    And User provides details in the Change Location page
    Then change location request is submitted successfully
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change in location For Approve By Manager
    And User starts proxy as "<User2>"
    And User Selects MyTasks And Accesses Change in location For Approve By Manager's Manager
    Then Change Jobs Change location Approved Successfully

    Examples:
      | User        | Task             | Worker               | User1 | User2 |
      | Jen Swenson | Start Job Change | Shruti Gandhi-Gupta | 070636 | 060104 |



  @HRSTEM-224 @WorkDataChanges @Positive @FCB2
  Scenario Outline: Manager changes work data change in hours for an associate without documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User start Job Change for "<Worker>" and "Change In Hours"
    Then user verifies Change In Hours is Completed successfully
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change In Hours For Approve By Manager's Manager
    Then Change Jobs Change In Hours Approved Successfully

    Examples:
      | User                  | Task             | Worker      | User1                         |
      | Jeff Ulmer (081814)   | Start Job Change | John Yusi   | Andrew Giangrave (060104)    |



  @HRSTEM-234 @jobchange @FCB2
  Scenario Outline: Validate change job task availability and routing to manager +1

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User start Job Change for "<Worker>" and "Change In Hours"
    Then user verifies Change In Hours is Completed successfully
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change In Hours For Approve By Manager's Manager
    Then Change Jobs Change In Hours Approved Successfully

    Examples:
      | User                | Task             | Worker         | User1                         |
      | Narcy Dean (060410) | Start Job Change | Edward Ciccone | Andrew Giangrave (060104)    |



  @HRSTEM-236 @jobchange @FCB2
  Scenario Outline: Validate manager+1 can deny the job change request

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User start Job Change for "<Worker>" and "Change In Hours"
    Then user verifies Change In Hours is Completed successfully
    And User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change In Hours
    Then Change Jobs Change In Hours Denied Successfully

    Examples:
      | User   | Task             | Worker         | User1                         |
      | 060410 | Start Job Change | Bruno Amalberti | Andrew Giangrave (060104)   |



  @HRSTEM-224 @WorkDataChanges @Positive @FCB2
  Scenario Outline: Manager initiates work data change in hours for an associate with documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User initiates work data change request for an "<Worker>" and "Change In Hours"
    And User provides the details and supporting documentation
      | Description             | Category         |
      | ChangeInHours Document | Other Documents  |
    Then request is submitted successfully
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change In Hours For Approve By Manager's Manager
    Then Change Jobs Change In Hours Approved Successfully

    Examples:
      | User   | Task             | Worker      | User1 |
      | 070636 | Start Job Change | Mitch Smith | 060104 |



  @HRSTEM-225 @WorkDataChanges @Positive @RunPipeline @FCB2
  Scenario Outline: Manager initiates work data change Location for an associate with documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User initiates work data change request for an "<Worker>" and "Change Location"
    And User provides details and supporting documentation in the Change Location page
      | Description               | Category         |
      | ChangeInLocation Document | Other Documents  |
    Then change location request is submitted successfully

    Examples:
      | User   | Task             | Worker          |
      | 070636 | Start Job Change | Lindsey Schmitz |



  @HRSTEM-226 @WorkDataChanges @Positive @FCB2
  Scenario Outline: Manager+1 approves work data changes with documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change in location For Approve By Manager's Manager
    Then Change Jobs Change location Approved Successfully

    Examples:
      | User1 |
      | 060104 |



  @HRSTEM-225 @WorkDataChanges @Positive @FCB2
  Scenario Outline: Manager changes work data change Location for an associate without documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User>" and selects "<Task>"
    And User initiates work data change request for an "<Worker>" and "Change Location"
    And User provides details in the Change Location page
    Then change location request is submitted successfully

    Examples:
      | User   | Task             | Worker   |
      | 070636 | Start Job Change | Todd Ngo |



  @HRSTEM-228 @WorkDataChanges @Positive @FCB2
  Scenario Outline: Manager+1 approves work data changes without documentation

    Given User logged into workday HCM Core as "Associate"
    When User starts proxy as "<User1>"
    And User Selects MyTasks And Accesses Change in location For Approve By Manager's Manager
    Then Change Jobs Change location Approved Successfully

    Examples:
      | User1 |
      | 060104 |