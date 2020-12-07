require "selenium-webdriver"
require "rspec"

driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

driver.get "http://tiki.vn/"

num_of_products = 5

# driver.find_element(css: ".eUnWAD").send_keys "apple", :enter
n = 0
# while n < 2
sleep 2
products = driver.find_elements(css: "p.title")
products[n].click

driver.manage.timeouts.implicit_wait = 5
driver.find_element(css: "input.input").send_keys :backspace, "num_of_products"
driver.find_element(css: ".btn-add-to-cart").click

num_of_cart = driver.find_element(css: ".bDWZEC").text.to_i

if num_of_cart == num_of_products
  expect(driver.find_element(css: "p.tatus").displayed?).to be_truthy
  # if n < 1
  #   driver.navigate.back
  # end
else
  driver.find_element(css: "input.input").send_keys :backspace, "1"
  driver.find_element(css: ".btn-add-to-cart").click
  # expect(driver.find_element(css: "p.message").displayed?).to be_truthy
  expect(driver.find_element(css: "p.tatus").displayed?).to be_truthy
end
#   n += 1
# end
# driver.manage.timeouts.implicit_wait = 5
driver.find_element(css: ".icon-cart").click
sleep 2

driver.close
