require 'selenium-webdriver'


descripe "d0asdassd" do
    before(:all) do
        driver = Selenium::WebDriver.for :chrome
        driver.manage.window.maximize
        driver.get 'http://practice.automationtesting.in/'
    end
    after(:all) do
        driver.quit 
    end

    it"lalala" do
        elements = driver.find_elements(css: '.woocommerce-LoopProduct-link')
        elements[0].click
        driver.find_element(css: '.text').clear
        driver.find_element(css: '.text').send_keys 465
        driver.find_element(css: '.alt').click
        alert = driver.switch_to.alert
        alert_text = alert.text
        puts alert_text
        sleep 2 
    end
end