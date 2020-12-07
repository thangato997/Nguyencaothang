import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys
import org.openqa.selenium.WebDriver as WebDriver
import com.kms.katalon.core.webui.driver.DriverFactory as DriverFactory
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUiBuiltInKeywords
import java.util.List as List
import org.openqa.selenium.By as By
import org.openqa.selenium.WebElement as WebElement
import org.junit.Assert as Assert
import org.testng.asserts.SoftAssert as SoftAssert
import com.kms.katalon.selenium.driver.CChromeDriver as CChromeDriver

WebUI.openBrowser('https://tiki.vn/')

WebUI.maximizeWindow()

WebUI.sendKeys(findTestObject('search field'), 'book')

WebUI.sendKeys(findTestObject('search field'), Keys.chord(Keys.ENTER))

WebUI.delay(1)

WebDriver driver = DriverFactory.getWebDriver()

List<WebElement> elements = driver.findElements(By.cssSelector('.name>span'))

def String productTitle = elements.get(5).getText()

elements.get(5).click()

WebUI.delay(3)

def String ProdName = WebUI.getText(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/produc title'))

WebUI.verifyEqual(ProdName, productTitle)

def String numOfProd = "2"

if (numOfProd != '1') {
	WebUI.clearText(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/input field'))
//    driver.findElement(By.cssSelector('.input')).clear()
	WebUI.sendKeys(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/input field'), numOfProd)
//    driver.findElement(By.cssSelector('.input')).sendKeys(numOfProd)
	
	
}

WebUI.click(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/btn-add-to-cart'))
//driver.findElement(By.cssSelector('.btn-add-to-cart')).click()

WebUI.delay(1)

WebUI.verifyEqual(numOfProd, WebUI.getText(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/products inside the cart')))
//driver.findElement(By.cssSelector(".bDWZEC")).getText())

WebUI.click(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/notification'))
//driver.findElement(By.cssSelector('div.slidedown-footer>button:nth-child(2)')).click()

WebUI.click(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/icon-cart'))
//driver.findElement(By.cssSelector('.icon-cart')).click()

WebUI.verifyEqual(ProdName, WebUI.getText(findTestObject('Object Repository/Page_Mua Hng Trc Tuyn Uy Tn vi Gi R Hn ti Tiki.vn/cart-products-name')))

WebUI.closeBrowser()

