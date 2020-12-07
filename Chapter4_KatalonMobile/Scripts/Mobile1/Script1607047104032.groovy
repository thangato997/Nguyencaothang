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

Mobile.startApplication('C:\\Users\\thang\\Desktop\\Katalon\\Mobile\\androidapp\\APIDemos.apk', true)

Mobile.tap(findTestObject('1/android.widget.Button - OK'), 0)

Mobile.tap(findTestObject('Object Repository/1/android.widget.TextView - Accessibility'), 0)

Mobile.tap(findTestObject('Object Repository/1/android.widget.TextView - Accessibility Node Querying'), 0)

Mobile.verifyElementChecked(findTestObject('Object Repository/1/android.widget.CheckBox (1)'), 0)

Mobile.verifyElementNotChecked(findTestObject('Object Repository/1/android.widget.CheckBox (2)'), 0)

Mobile.pressBack()

Mobile.pressBack()

Mobile.tap(findTestObject('Object Repository/1/android.widget.TextView - Text'), 0)

Mobile.tap(findTestObject('Object Repository/1/android.widget.TextView - LogTextBox'), 0)

Mobile.tap(findTestObject('Object Repository/1/android.widget.Button - Add'), 0)

text1 = Mobile.getText(findTestObject('Object Repository/1/android.widget.TextView - This is a test'), 5).trim()

Mobile.verifyEqual(text1, 'This is a test')

Mobile.pressBack()

Mobile.tap(findTestObject('Object Repository/1/android.widget.TextView - Marquee'), 0)

Mobile.verifyEqual(Mobile.getText(findTestObject('Object Repository/1/android.widget.Button - This use the default marquee animation limit of 3'), 
        0).trim(), 'This use the default marquee animation limit of 3')

Mobile.closeApplication()

