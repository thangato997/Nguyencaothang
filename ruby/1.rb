require "selenium-webdriver"
require "rspec"
require 'webdrivers'


describe "Current Expense" do


  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "http://practice.automationtesting.in/"
    @driver.manage.window.maximize
  end

  after(:all) do
    @driver.quit   
  end


  it "Check icon" do
    @driver.get(@base_url)
    book = @driver.find_element(css: '[type="submit"]')
    @driver.mouse.initialize
    @driver.mouse.move_to(@driver.find_element(css: '[type="submit"]'))
    status = @driver.mouse.status
    puts status
  end
end