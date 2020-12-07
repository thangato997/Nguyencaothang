# Generated by Selenium IDE
require 'selenium-webdriver'
require 'webdrivers'
describe 'Rad' do
  before(:all) do
    # @driver = Selenium::WebDriver.for :chrome
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 60 # seconds.
    # @driver = Selenium::WebDriver.for :chrome
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    @driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:4444", :http_client => client, :desired_capabilities => caps)
  end 
  after(:each) do
    @driver.quit
  end
  it 'rad' do
    @driver.get('https://the-internet.herokuapp.com/')
    @driver.manage.window.maximize
    @driver.find_element(:link_text, 'Entry Ad').click
    @driver.find_element(:id, 'restart-ad').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.modal') }
    if @driver.execute_script("return (document.querySelector(\'#modal\') && document.querySelector(\'#modal\').offsetHeight != 0)")
      @driver.find_element(:css, '.modal-footer > p').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { !@driver.find_element(:css, '.modal').displayed? }
    end
    @driver.close
  end
end