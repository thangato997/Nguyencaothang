require 'selenium-webdriver'

describe"create and switch to new tab" do
    before(:all) do
        @driver = Selenium::WebDriver.for :chrome
        @driver.manage.window.maximize
        @driver.get "https://www.google.com.vn/"
    end
    after(:all) do
        @driver.quit()
    end

    it"test1" do
        search_field = @driver.find_element(css: '[name="q"]')
        search_field.send_keys "google", :enter
        @driver.execute_script("window.open()")
        @driver.switch_to.window(@driver.window_handles.last)
        @driver.get "https://www.youtube.com/?gl=VN"
        sleep 5
    end
end