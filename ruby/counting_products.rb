require "selenium-webdriver"
# require 'webdrivers'
require 'rspec'

$value = "book"
$products = 48

describe "Count Products that were displayed" do
  before(:all) do
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 600 # seconds.
    # @driver = Selenium::WebDriver.for :chrome
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    @driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:4444/", :http_client => client, :desired_capabilities => caps)
  end

  before(:each) do
    @driver.get "https://tiki.vn/"
  end

  after(:each) do
    @driver.quit
  end
  it "count the books were displayed" do
    @driver.find_element(css: ".eUnWAD").send_keys $value, :enter
    # use implicit_wait to wait for the page to load
    sleep 1
    # use find_elements by css via class
    elements = @driver.find_elements(css: ".product-item")
    # get total of products by getting size of the value elements
    count = elements.size
    # confirm the count is correct or not
    expect(count).to eql($products)
    # print to the screen
    puts "products are counted: "+ count.to_s
  end
end