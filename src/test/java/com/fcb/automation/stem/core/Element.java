package com.fcb.automation.stem.core;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class Element {

    WebDriverWait wait =
            new WebDriverWait(
                    DriverFactory.getDriver(),
                    Duration.ofSeconds(10));

    public void click(By locator) {

        wait.until(
                        ExpectedConditions
                                .elementToBeClickable(locator))
                .click();
    }

    public void type(By locator, String value) {

        WebElement element =
                wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(locator));

        element.clear();

        element.sendKeys(value);
    }

    public boolean isDisplayed(By locator) {

        return wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(locator))
                .isDisplayed();
    }

    public String getText(By locator) {

        return wait.until(
                        ExpectedConditions
                                .visibilityOfElementLocated(locator))
                .getText();
    }
}