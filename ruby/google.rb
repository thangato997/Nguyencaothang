require 'selenium-webdriver'
require 'roo'

    print "Choose a browser: "
    @browser = gets.chomp
describe "Search with google" do
    before(:all) do
        @driver = Selenium::WebDriver.for @browser
        file = File.join(File.dirname(__FILE__),"./google.xlsx")
        excel = Roo::Speadsheet.open file
        sheet = excel.sheet 0
        
    end
end