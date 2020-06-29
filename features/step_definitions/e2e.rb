Dado('que estou navegando na {string}') do |url|
    visit 'https://magento.nublue.co.uk/'
end

Dado('realizo acesso com {string} e {string}') do |user, pass|
    click_link_or_button 'Sign In'
    find("#email").set user
    find("#pass").set pass
    click_button 'Sign In'
    assert_text 'Veronica Costello'
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
    sleep 5
    @WIP
    # find("#GP2NNCE").set FFaker::AddressIN.street_address
    # find("#JF8OFA4").set FFaker::AddressIN.city
    # select 'BS7RN86', from: 'Arizona'
    # find("#RCC1CIW").set FFaker::AddressIN.zip_code
    # select 'GIJ4DPB', from: 'Maldives'
    # find("#RV7XG2B").set FFaker::PhoneNumberAU.international_mobile_phone_number
    # click_button 'Next'
    # sleep 2
end

Quando('finalizo a compra') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('vejo meu numero de pedido') do
  pending # Write code here that turns the phrase above into concrete actions
end