require 'roo'
require 'rspec-expectations'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

# Load file excel
excel_file = File.join(File.dirname(__FILE__),"./Book1.xlsx")
excel_book = Roo::Spreadsheet.open excel_file
sheet1 = excel_book.sheet 0 # first sheet

# Interate each row in the first sheet
sheet1.each_with_index do |row, idx|
    next if idx == 0 #ignore first row
    description, login, password, expected_text = row[0], row[1], row[2], row[3]
    driver.get("http://travel.agileway.net")
    driver.find_element(name: "username").send_keys(login)  
    driver.find_element(name: "password").send_keys(password)
    driver.find_element(name: "username").submit
    
    RSpec::Expectations.expect(driver.find_element(:tag_name => "body").text).to include(expected_text)

    # If login OK, try log out, so next one can continue
    fail_safe{driver.find_element(:link_text, "Sign off").click}
end
