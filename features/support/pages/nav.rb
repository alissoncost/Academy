class Nav
    include Capybara::DSL
    
    def visit_url(url)
        url = DATA[url]
        p url
        visit(url)
    end

    def login(user, pass)
        click_link_or_button 'Sign In'
        user = DATA[user]
        pass = DATA[pass]
        find(EL["login"]).set user
        find(EL["password"]).set pass
        click_button 'Sign In'
        sleep 1
        assert_text 'Veronica Costello', wait: 4
    end

    def add_item_cart(item_search)
        find("#search").set item_search
        click_button 'Search'
        first(EL["first_product"]).click
        find("#option-label-size-142-item-168").click
        find("#option-label-color-93-item-52").click
        find("#qty").set 2
        click_button EL["bttn_addcart"]

    end

    def access_checkout
        sleep 2
        click_link 'shopping cart'
        sleep 2
        click_button EL["bttn_checkout"]
    end

    def valid_selector
        assert_no_selector(".loader", wait:15)
    end

    def valid_address_on
        first(".radio").click
        click_button EL["bttn_next"]
    end

    def valid_address_off
        find(:xpath,EL["street"]).set FFaker::AddressIN.street_address
        find(:xpath,EL["city"]).set FFaker::AddressIN.city
        find(:xpath,EL["region"]).click
        select 'Arizona'
        find(:xpath,EL["postcode"]).set FFaker::AddressIN.zip_code
        find(:xpath,EL["country"]).click
        select 'United States'
        find(:xpath,EL["phone"]).set FFaker::PhoneNumberAU.international_mobile_phone_number
        first(".radio").click
        click_button EL["bttn_next"]
    end

end