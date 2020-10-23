Dado('que estou navegando na {string}') do |url|
        url = DATA[url]
        p url
        visit(url)
        sleep 10
end

Dado('realizo acesso com {string} e {string}') do |user, pass|
    @nav = Nav.new
    @nav.login(user, pass)
    
end

Quando('adiciono o item {string} ao carrinho') do |item_search|
  @nav = Nav.new
  @nav.add_item_cart(item_search)
  sleep 4
end

Quando('avanço para o checkout') do
    @nav = Nav.new
    @nav.access_checkout
end

Quando('preencho os dados de Shipping') do
  @nav = Nav.new
  @nav.valid_selector  

      if has_selector?(:xpath,"//button[@class='action action-show-popup']")
          @nav = Nav.new
          @nav.valid_address_on

      else
          @nav = Nav.new
          @nav.valid_address_off
    end

end

Quando('finalizo a compra') do
  @nav = Nav.new
  @nav.valid_selector
  click_button 'Place Order', wait: 6
end


Então('vejo meu numero de pedido') do
  @nav = Nav.new
  @nav.valid_selector
  assert_text 'Thank you for your purchase!', wait: 4
end