class Nav
    include Capybara::DSL
    
    def visits(url)
        url = DATA[url]
        p url
        visit(url)
    end

    def login(user, pass)
        click_link_or_button 'Sign In'
        user = DATA[user]
        pass = DATA[pass]
        find("#email").set user
        find("#pass").set pass
        click_button 'Sign In'
        sleep 1
        assert_text 'Veronica Costello', wait: 4
    end

    def add_item_cart(item_search)
        find("#search").set item_search
        click_button 'Search'
        first(".product-item-link").click
        find("#option-label-size-142-item-168").click
        find("#option-label-color-93-item-52").click
        find("#qty").set 2
        click_button 'product-addtocart-button'

    end

    def access_checkout
        sleep 2
        click_link 'shopping cart'
        sleep 2
        click_button 'Proceed to Checkout'
    end

    def valid_selector
        assert_no_selector(".loader", wait:15)
    end

    def valid_address_on
        first(".radio").click
        click_button 'Next'
    end

    def valid_address_off
        find(:xpath,"//input[@name='street[0]']").set FFaker::AddressIN.street_address
        find(:xpath,"//input[@name='city']").set FFaker::AddressIN.city
        find(:xpath,"//select[@name='region_id']").click
        select 'Arizona'
        find(:xpath,"//input[@name='postcode']").set FFaker::AddressIN.zip_code
        find(:xpath,"//select[@name='country_id']").click
        select 'United States'
        find(:xpath,"//input[@name='telephone']").set FFaker::PhoneNumberAU.international_mobile_phone_number
        first(".radio").click
        click_button 'Next'
    end

end