package com.fcb.automation.stem;

import java.io.FileInputStream;
import java.io.IOException;

public class ConfigReader {

    static java.util.Properties prop;

    public ConfigReader() {

        try {

            FileInputStream fis =
                    new FileInputStream(
                            "properties/Config-qa.properties");

            prop = new java.util.Properties();

            prop.load(fis);

        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    public static String getProperty(String key) {

        return prop.getProperty(key);
    }
}