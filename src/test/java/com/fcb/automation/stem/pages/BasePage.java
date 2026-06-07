package com.fcb.automation.stem.pages;

import com.fcb.automation.stem.core.DriverFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import java.time.Duration;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BasePage {

    WebDriver driver = DriverFactory.getDriver();

    public void click(By locator){
        driver.findElement(locator).click();
    }

    public void enterText(By locator,String value){
        driver.findElement(locator).sendKeys(value);
    }

    public String getText(By locator){
        return driver.findElement(locator).getText();
    }

    public void waitUntilVisible(By locator) {

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        wait.until(ExpectedConditions.visibilityOfElementLocated(locator)
        );
    }
}