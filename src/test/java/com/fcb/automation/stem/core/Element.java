
package com.fcb.automation.stem.core;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Element {

    private By locator;

    WebDriverWait wait = new WebDriverWait(DriverFactory.getDriver(), Duration.ofSeconds(10));

    public Element(By locator) {
        this.locator = locator;
    }

    public void click() {

        wait.until(ExpectedConditions.elementToBeClickable(locator)).click();
    }

    public void type(String value) {

        WebElement element = wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
        element.clear();
        element.sendKeys(value);
    }

    public boolean isDisplayed() {

        return wait.until(ExpectedConditions.visibilityOfElementLocated(locator)).isDisplayed();
    }

    public String getText() {

        return wait.until(ExpectedConditions.visibilityOfElementLocated(locator)).getText();
    }

    public void clear() {

        wait.until(ExpectedConditions.visibilityOfElementLocated(locator)).clear();
    }

    public void sendKeys(String value) {

        wait.until(ExpectedConditions.visibilityOfElementLocated(locator)).sendKeys(value);
    }
}