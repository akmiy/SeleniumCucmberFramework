package com.fcb.automation.stem.stepDefs.sample;

import com.fcb.automation.stem.ConfigReader;
import com.fcb.automation.stem.core.DriverFactory;
import com.fcb.automation.stem.pages.Haspage;
import com.fcb.automation.stem.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.testng.Assert;

public class SampleStepDefs extends Haspage {

    @Given("user launches application")
    public void launchApplication() {

        DriverFactory.getDriver().get(ConfigReader.getProperty("URL"));
    }

    @When("user performs login")
    public void performLogin() {

        loginPage.enterUsername();
        loginPage.enterPassword();
        loginPage.clickLogin();
    }

    @Then("login should be successful")
    public void verifyLogin() {

        Assert.assertTrue(loginPage.verifyDashboardDisplayed());
    }

}