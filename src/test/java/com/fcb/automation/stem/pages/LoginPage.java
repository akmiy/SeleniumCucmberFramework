package com.fcb.automation.stem.pages;

import com.fcb.automation.stem.ConfigReader;
import com.fcb.automation.stem.core.DriverFactory;
import com.fcb.automation.stem.core.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;

public class LoginPage extends BasePage{

    public Element username = new Element( By.name("username"));
    public Element password = new Element(By.name("password"));
    public Element loginButton = new Element(By.xpath("//button[@type='submit']"));
    public Element dashboardText = new Element(By.xpath("//h6[text()='Dashboard']"));

    public void enterUsername() {

        username.type(ConfigReader.getProperty("username"));
    }

    public void enterPassword() {

        password.type(ConfigReader.getProperty("password"));
    }

    public void clickLogin() {

        loginButton.click();
    }

    public boolean verifyDashboardDisplayed() {

        return dashboardText.isDisplayed();
    }
}