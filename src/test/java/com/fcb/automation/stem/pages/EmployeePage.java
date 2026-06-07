package com.fcb.automation.stem.pages;

import java.util.HashMap;
import com.fcb.automation.stem.core.Element;
import org.openqa.selenium.By;

public class EmployeePage extends BasePage {

    public Element pimMenu = new Element(By.xpath("//span[text()='PIM']"));
    public Element addEmployeeBtn = new Element(By.xpath("//a[text()='Add Employee']"));
    public Element firstName = new Element(By.xpath("//label[text()='Employee Full Name']/following::input[1]"));
    public Element lastName = new Element(By.xpath("//label[text()='Employee Full Name']/following::input[3]"));
    public Element employeeId = new Element(By.xpath("//label[text()='Employee Id']/following::input[1]"));
    public Element saveButton = new Element(By.xpath("//button[@type='submit']"));

    public Element SearchButton = new Element(By.xpath("//button[normalize-space()='Search']"));
    public Element Address = new Element(By.xpath("//h6[text()='Address']/following::input[1]"));
    public Element City = new Element(By.xpath("//h6[text()='Address']/following::input[3]"));
    public Element State = new Element(By.xpath("//h6[text()='Address']/following::input[4]"));
    public Element ZipCode = new Element(By.xpath("//h6[text()='Address']/following::input[5]"));

}