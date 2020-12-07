require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

driver.get "https://spaceshare.vn/"

driver.find_element(xpath: "//li[contains(text(),'Văn phòng trọn gói')]").click

# driver.find_element(css: "input[placeholder='Chọn tỉnh / thành phố']").click
driver.find_element_css("input[placeholder='Chọn tỉnh / thành phố']")

driver.manage.timeouts.implicit_wait = 5

driver.find_element(xpath: "//div[contains(text(),'Thành phố Hồ Chí Minh')]").click

# aaa = driver.find_element(xpath: "//li[contains(text(),'Văn phòng trọn gói')]").location

# Kernel.puts aaa

sleep 1

driver.close
