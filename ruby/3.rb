require 'selenium-webdriver'

describe"alert2" do
    before(:all) do
        driver = Selenium::WebDriver.for :chrome
        driver.manage.window.maximize
        driver.get 'http://the-internet.herokuapp.com/javascript_alerts'
    end
    after(:all) do
        driver.quit
    end

    
end