//package com.fcb.automation.stem.stepDefs;
//
//import com.fcb.automation.stem.core.TestContext;
//import com.fcb.automation.stem.pages.HasPages;
//import com.fcb.automation.stem.pages.SamplePage;
//import io.cucumber.java.en.Given;
//import io.cucumber.java.en.Then;
//import io.cucumber.java.en.When;
//import org.openqa.selenium.chrome.ChromeDriver;
//
//import java.util.Properties;
//
//public class HCM_Core_Login_StepDefs extends HasPages {
//    String UserName,Password;
//
//    public HCM_Core_Login_StepDefs(TestContext testContext) {super(testContext);}
//
//
//    /*@Given("User navigate to homepage")
//    public void user_navigate_to_homepage()  throws InterruptedException{
//
//        TestContext.driver = new ChromeDriver();
//        TestContext.driver.manage().window().maximize();
//        TestContext.driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login?lang=en");
//        Thread.sleep(3000);
//        LoginPage = new SamplePage(new TestContext());
//    }
//
//    @When("User provides valid credentials {string} and {string}")
//    public void user_provides_valid_credentials(String username, String password) throws InterruptedException {
//
//        Thread.sleep(3000);
//        LoginPage.UsernameField.sendKeys(username);
//        LoginPage.PasswordField.sendKeys(password);
//        LoginPage.LoginButton.click();
//    }
//
//    @Then("User landed on homepage")
//    public void user_landed_on_homepage() {
//
//        System.out.println(TestContext.driver.getTitle());
//    }*/
//
//    /*@Given("User logged into workday as {string}")
//    public void user_logged_into_workday_as(String userRole)  throws InterruptedException{
//        switch (userRole){
//            case "Associate":
//                UserName = Properties.HCMCORE_ASSOCIATE_USERNAME;
//                Password = Properties.HCMCORE_ASSOCIATE_PASSWORD;
//        }
//    }
//    this.testContext.driver.get(Properties.WorkDayHCMCoreURL);
//    LoginPage.UsernameField.sendKeys(UserName);
//    LoginPage.PasswordField.sendKeys(Password);
//    LoginPage.LoginButton.click();*/
//
//
//}