Dado('que estou navegando na {string}') do |url|
    visit 'https://magento.nublue.co.uk/'
end

Dado('realizo acesso com {string} e {string}') do |user, pass|
    click_link_or_button 'Sign In'
    find("#email").set user
    find("#pass").set pass
    click_button 'Sign In'
    assert_text 'Veronica Costello', wait: 4
end

Quando('adiciono o item {string} ao carrinho') do |item_search|
  find("#search").set item_search
  click_button 'Search'
  first(".product-item-link").click
  find("#option-label-size-142-item-168").click
  find("#option-label-color-93-item-52").click
  find("#qty").set 2
  click_button 'product-addtocart-button'
end

Quando('avanço para o checkout') do
    click_link 'shopping cart', wait: 2
    sleep 2
    click_button 'Proceed to Checkout', wait: 4
end

Quando('preencho os dados de Shipping') do
    assert_no_selector(".loader", wait:15)
    find(:xpath,"//input[@name='street[0]']").set FFaker::AddressIN.street_address
    find(:xpath,"//input[@name='city']").set FFaker::AddressIN.city
    find(:xpath,"//select[@name='region_id']").click
    select 'Arizona'
    find(:xpath,"//input[@name='postcode']").set FFaker::AddressIN.zip_code
    find(:xpath,"//select[@name='country_id']").click
    select 'United States'
    find(:xpath,"//input[@name='telephone']").set FFaker::PhoneNumberAU.international_mobile_phone_number
    first(".radio").click
    sleep 5
    click_button 'Next'
    sleep 2
end

Quando('finalizo a compra') do
  click_button 'Place Order'
end

Então('vejo meu numero de pedido') do
  assert_text 'Thank you for your purchase!'
end