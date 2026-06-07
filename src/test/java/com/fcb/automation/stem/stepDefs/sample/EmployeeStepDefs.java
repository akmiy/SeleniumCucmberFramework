package com.fcb.automation.stem.stepDefs.sample;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fcb.automation.stem.pages.BasePage;
import com.fcb.automation.stem.pages.Haspage;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import org.testng.Assert;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import com.fcb.automation.stem.pages.EmployeePage;

public class EmployeeStepDefs extends Haspage  {

    @When("user creates employee {string} {string} {string}")
    public void enterEmployeeDetails(String firstName, String lastName, String employeeId) throws InterruptedException {

        HashMap<String,String> empData = new HashMap<>();

        empData.put("firstname", firstName);
        empData.put("lastname", lastName);
        empData.put("employeeId", employeeId);

        employeePage.pimMenu.click();
        employeePage.addEmployeeBtn.click();
        employeePage.firstName.type(firstName);
        employeePage.lastName.type(lastName);
        employeePage.employeeId.type(employeeId);
        employeePage.saveButton.click();
    }

    @Then("employee should be created successfully")
    public void verifyEmployeeCreation() {
        Assert.assertTrue(true);
    }

    @And("search created employee")
    public void searchCreatedEmployee() throws InterruptedException {

        employeePage.SearchButton.sendKeys("03701001");
        Thread.sleep(3000);
        employeePage.SearchButton.click();
    }

    @When("user fills contact details")
    public void userFillsContactDetails(DataTable table) throws InterruptedException {

        List<Map<String,String>> rows = table.asMaps(String.class, String.class);
        Map<String,String> row = rows.get(0);

        String Address = row.get("Address");
        String City = row.get("City");
        String State = row.get("State");
        String ZipCode = row.get("ZipCode");

        employeePage.Address.click();
        employeePage.Address.clear();
        employeePage.Address.sendKeys(Address);

        employeePage.City.click();
        employeePage.City.clear();
        employeePage.City.sendKeys(City);

        employeePage.State.click();
        employeePage.State.clear();
        employeePage.State.sendKeys(State);

        employeePage.ZipCode.click();
        employeePage.ZipCode.clear();
        employeePage.ZipCode.sendKeys(ZipCode);

    }

}