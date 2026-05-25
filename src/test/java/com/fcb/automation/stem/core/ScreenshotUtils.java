package com.fcb.automation.stem.core;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.io.File;
import java.io.IOException;

public class ScreenshotUtils {

    public static void captureScreenshot(String screenshotName) {

        TakesScreenshot ts =
                (TakesScreenshot) DriverFactory.getDriver();

        File source =
                ts.getScreenshotAs(OutputType.FILE);

        File destination =
                new File("screenshots/" + screenshotName + ".png");

        try {

            FileUtils.copyFile(source, destination);

        } catch (IOException e) {

            e.printStackTrace();
        }
    }
}