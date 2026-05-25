package com.fcb.automation.stem.pages;

import com.fcb.automation.stem.ConfigReader;
import com.fcb.automation.stem.core.DriverFactory;
import com.fcb.automation.stem.core.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class LoginPage {

    WebDriver driver =
            DriverFactory.getDriver();

    WebDriverWait wait =
            new WebDriverWait(driver,
                    Duration.ofSeconds(10));

    Element element = new Element();

    By username =
            By.name("username");

    By password =
            By.name("password");

    By loginButton =
            By.xpath("//button[@type='submit']");

    By dashboardText =
            By.xpath("//h6[text()='Dashboard']");



    public void enterUsername() {

        /*WebElement user =
                wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(username));

        user.sendKeys(ConfigReader.getProperty("username"));*/
        element.type(username,
                ConfigReader.getProperty("username"));
    }

    public void enterPassword() {

       /* WebElement pass =
                wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(password));

        pass.sendKeys(ConfigReader.getProperty("password"));*/
        element.type(password,
                ConfigReader.getProperty("password"));
    }

    public void clickLogin() {

       /* WebElement login =
                wait.until(
                        ExpectedConditions
                                .elementToBeClickable(loginButton));

        login.click();*/
        element.click(loginButton);
    }

    public boolean verifyDashboardDisplayed() {

      /*  WebElement dashboard =
                wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(dashboardText));

        return dashboard.isDisplayed();*/
        return element.isDisplayed(dashboardText);
    }
}