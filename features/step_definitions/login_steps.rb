Given("user navigate to the login page") do
  $driver.get "http://the-internet.herokuapp.com/login"
end

When("user enter {string} and {string}") do |string, string2|
  # $driver.find_element(css: "#username").send_keys string
  enter_text("user", string)
  # $driver.find_element(css: "#password").send_keys string2
  enter_text("pass", string2)
  # driver.find_element(css: ".fa").click
  click("button")
end

Then("user verify the message {string}") do |string|
  # text = $driver.find_element(css: "#flash").text
  expect(get_element_text("text")).to include(string)
end
