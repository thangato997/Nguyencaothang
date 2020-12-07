require 'selenium-webdriver'
require 'webdrivers'

describe "test alert" do
    before(:all) do
        $driver = Selenium::WebDriver.for :chrome
        $driver.manage.window.maximize
        $driver.get 'http://the-internet.herokuapp.com/javascript_alerts'
        $elements = $driver.find_elements(css: "li > button")
    end
    after(:all) do
        $driver.quit 
    end

    it"alert 1" do
        $elements[0].click
        alert = $driver.switch_to.alert
        expect(alert.text).to eq("I am a JS Alert")
        alert.accept
    end
    
    it"alert 2" do
        $elements[1].click
        alert = $driver.switch_to.alert
        expect(alert.text).to eq("I am a JS Confirm")
        alert.dismiss
    end

    it"alert 3" do
        $elements[2].click
        alert = $driver.switch_to.alert
        alert.send_keys 'toi khong phai la alert'
        expect(alert.text).to eq("I am a JS prompt")
        alert.accept
    end
end