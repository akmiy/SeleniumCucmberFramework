package com.fcb.automation.stem.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(

        features = "src/test/java/com/fcb/automation/stem/features/Employee.feature",

        glue = {
                "com.fcb.automation.stem.stepDefs.sample",
                "com.fcb.automation.stem.core"
        },

        plugin = {
                "pretty",
                "html:target/cucumber-report.html"
        },

        monochrome = true
)

public class TestRunner
        extends AbstractTestNGCucumberTests {

}