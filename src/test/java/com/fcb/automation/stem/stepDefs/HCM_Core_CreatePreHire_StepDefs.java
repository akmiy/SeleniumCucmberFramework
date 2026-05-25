/*
package com.fcb.automation.stem.stepDefs;

import com.fcb.automation.acebase.core.context.TestContext;
import com.fcb.automation.acebase.utils.StringUtils;
import com.fcb.automation.stem.pages.HasPages;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.Keys;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

public class HCM_Core_CreatePreHire_StepDefs extends HasPages {

    public HCM_Core_CreatePreHire_StepDefs(TestContext<?> testContext) {super(testContext);}
    static String FirstName = "", LastName = "", EmailId = "", addressLine1 = "", city = "";
    public Create_Position_In_JobRequisition CreatePosition = new Create_Position_In_JobRequisition(this.TestContext);
    public CreateJobPositionHireStepDefs CreateJobPositionHireStepDefs = new CreateJobPositionHireStepDefs(this.TestContext);

    @When("User create PreHire with {string} for proxy as {string}")
    public void userCreatesPreHire(String task, String user, DataTable table) {
        step(() -> {

            List<Map<String, String>> rows = table.asMaps(String.class, String.class);
            Map<String, String> row = rows.get(0);

            String PhoneNumber = row.get("Phone Number");
            String PhoneType = row.get("Phone Type");
            String State = row.get("State");
            String PostalCode = row.get("Postal Code");
            String AddressType = row.get("Address Type");
            String EmailType = row.get("Email Type");

            CreatePosition.userStartsProxyAs(user);
            CreatePosition.userAccessThe(task);

            FirstName = "AUTFname_" + StringUtils().getRandomAlphabetic(4);
            LastName = "AUTLname_" + StringUtils().getRandomAlphabetic(4);
            String FullName = FirstName + " " + LastName;

            HireDetails.put("Full_Name", FullName);

            CreatePreHire_HCMCore.FirstnameField.waitUntilVisible();
            CreatePreHire_HCMCore.FirstnameField.click();
            CreatePreHire_HCMCore.FirstnameField.clear();
            CreatePreHire_HCMCore.FirstnameField.sendKeys(FirstName);

            CreatePreHire_HCMCore.LastnameField.waitUntilVisible();
            CreatePreHire_HCMCore.LastnameField.click();
            CreatePreHire_HCMCore.LastnameField.clear();
            CreatePreHire_HCMCore.LastnameField.sendKeys(LastName);

            CreatePreHire_HCMCore.MoreTabDropdown.waitUntilClickable();
            CreatePreHire_HCMCore.MoreTabDropdown.click();

            Thread.sleep(2000);

            CreatePreHire_HCMCore.ContactInformationTab.waitUntilClickable();
            CreatePreHire_HCMCore.ContactInformationTab.click();

            CreatePreHire_HCMCore.PhoneAddButton.waitUntilClickable();
            CreatePreHire_HCMCore.PhoneAddButton.click();

            CreatePreHire_HCMCore.PhoneNumber.waitUntilVisible();
            CreatePreHire_HCMCore.PhoneNumber.click();
            CreatePreHire_HCMCore.PhoneNumber.clear();
            CreatePreHire_HCMCore.PhoneNumber.sendKeys(PhoneNumber);

            Thread.sleep(2000);

            CreatePreHire_HCMCore.PhoneType.click();
            CreatePreHire_HCMCore.PhoneType.sendKeys(PhoneType);
            CreatePreHire_HCMCore.PhoneType.sendKeys(Keys.ENTER);
            CreatePreHire_HCMCore.PhoneType.sendKeys(Keys.TAB);

            CreatePreHire_HCMCore.AddressAddButton.waitUntilClickable();
            CreatePreHire_HCMCore.AddressAddButton.click();

            addressLine1 = "AUTAddress_" + StringUtils().getRandomAlphabetic(4);

            CreatePreHire_HCMCore.AddressLine1.waitUntilVisible();
            CreatePreHire_HCMCore.AddressLine1.click();
            CreatePreHire_HCMCore.AddressLine1.clear();
            CreatePreHire_HCMCore.AddressLine1.sendKeys(addressLine1);

            city = "AUTCity_" + StringUtils().getRandomAlphabetic(4);

            CreatePreHire_HCMCore.City.waitUntilVisible();
            CreatePreHire_HCMCore.City.click();
            CreatePreHire_HCMCore.City.clear();
            CreatePreHire_HCMCore.City.sendKeys(city);

            Thread.sleep(2000);

            CreatePreHire_HCMCore.State.waitUntilVisible();
            CreatePreHire_HCMCore.State.click();
            CreatePreHire_HCMCore.State.clear();
            CreatePreHire_HCMCore.State.sendKeys(State + Keys.ENTER);
            CreatePreHire_HCMCore.State.sendKeys(Keys.TAB);

            CreatePreHire_HCMCore.PostalCode.waitUntilVisible();
            CreatePreHire_HCMCore.PostalCode.click();
            CreatePreHire_HCMCore.PostalCode.clear();
            CreatePreHire_HCMCore.PostalCode.sendKeys(PostalCode);

            Thread.sleep(2000);

            CreatePreHire_HCMCore.AddressType.click();
            CreatePreHire_HCMCore.AddressType.sendKeys(AddressType);
            CreatePreHire_HCMCore.AddressType.sendKeys(Keys.ENTER);
            CreatePreHire_HCMCore.AddressType.sendKeys(Keys.TAB);

            CreatePreHire_HCMCore.EmailAddButton.waitUntilClickable();
            CreatePreHire_HCMCore.EmailAddButton.click();

            EmailId = "AUTEmail_" + StringUtils().getRandomAlphabetic(4) + "@gmail.com";

            CreatePreHire_HCMCore.EmailAddress.waitUntilVisible();
            CreatePreHire_HCMCore.EmailAddress.click();
            CreatePreHire_HCMCore.EmailAddress.clear();
            CreatePreHire_HCMCore.EmailAddress.sendKeys(EmailId);

            Thread.sleep(2000);

            CreatePreHire_HCMCore.EmailType.click();
            CreatePreHire_HCMCore.EmailType.sendKeys(EmailType + Keys.ENTER);
            CreatePreHire_HCMCore.EmailType.sendKeys(Keys.TAB);

            Thread.sleep(3000);

            CreatePreHire_HCMCore.SubmitButton.scrollUntilVisible();
            CreatePreHire_HCMCore.SubmitButton.waitUntilClickable();
            CreatePreHire_HCMCore.SubmitButton.click();

        });
    }

    @Then("PreHire is created successfully")
    public void PreHire_is_created_successfully() throws InterruptedException {
        step(() -> {
            Thread.sleep(3000);
            String Message = CreatePreHire_HCMCore.SuccessMessage.getText();
            Assert.assertEquals(Message, "You have successfully created the following pre-hire.");

            String PreHireValue = CreatePreHire_HCMCore.PreHireValue.getText();
            String PreHireIDValue = CreatePreHire_HCMCore.PreHireIDValue.getText();
            HireDetails.put("PreHire_Value", PreHireValue);
            HireDetails.put("PreHireID_Value", PreHireIDValue);
            System.out.println("PreHire_Value :" + PreHireValue);
            System.out.println("PreHireID_Value :" + PreHireIDValue);

            CreatePreHire_HCMCore.DoneButton.waitUntilClickable();
            CreatePreHire_HCMCore.DoneButton.click();

        });

        CreateJobPositionHireStepDefs.GlobalSearchTextClear();
    }
}*/
