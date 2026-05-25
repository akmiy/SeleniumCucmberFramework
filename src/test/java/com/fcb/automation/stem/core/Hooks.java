package com.fcb.automation.stem.core;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;

public class Hooks {

    @Before
    public void setup() {

        DriverFactory.initializeBrowser();

        System.out.println("Browser launched");
    }

    @After
    public void tearDown(Scenario scenario) {

        if (scenario.isFailed()) {

            ScreenshotUtils.captureScreenshot(
                    scenario.getName());
        }

        DriverFactory.getDriver().quit();

        System.out.println("Browser closed");
    }
}