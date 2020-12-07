require 'selenium-webdriver'
require 'rspec'
require 'webdrivers'

describe"the items of tiki" do

    before(:all) do
        @driver = Selenium::WebDriver.for(:chrome)
        @driver.manage.window.maximize
        @driver.get("https://tiki.vn/")
    end
    
    after(:all) do
        @driver.quit
    end

    it"user can search and add the items to the cart" do
        # The number of items that will be select
        num_of_input = "2" 
        # Input data into the search field and hit enter
        search_field = @driver.find_element(css: ".eUnWAD")
        search_field.send_keys("book", :enter)

        @driver.manage.timeouts.implicit_wait = 5 # Wait for all items is present
        items = @driver.find_elements(css: ".name>span") # Find all of the item via cssSelector
        first_item_name = items[5].text # Get name of item
        items[5].click # Click on 6th item
        sleep 3 # stop to finish loading the page
        expect(@driver.find_element(css: "h1.title").text).to eq(first_item_name) # Verify the item via name
        
        # Input the number of selected items
        if (num_of_input != "1") 
            input_box = @driver.find_element(css: ".input")
            input_box.clear
            input_box.send_keys(num_of_input)
        end

        cart = @driver.find_element(css: ".btn-add-to-cart")
        cart.click # Add to the cart

        sleep 1  # stop to wait for adding to cart
        num_of_cart = @driver.find_element(css: ".bDWZEC").text # Get the number of items already added to the cart
        expect(num_of_cart).to eq(num_of_input) # Verify the number of items already added to the cart match the items inputted previously

        cart_icon = @driver.find_element(css: ".icon-cart")
        cart_icon.click # Click on the cart icon to navigate to cart page

        cart_item_name = @driver.find_element(css: ".cart-products__name").text # Get name of the item
        expect(cart_item_name).to eq(first_item_name) # Verify the name of item
    end
end