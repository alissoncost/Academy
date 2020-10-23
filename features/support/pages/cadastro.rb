class Cadastro
  include Capybara::DSL

  def access_create_account
    click_link_or_button 'Create an Account'
  end

  def create_account
    find("#firstname").set FFaker::NameBR.first_name
    find("#lastname").set FFaker::NameBR.last_name
    find("#email_address").set FFaker::Internet.disposable_email
    find("#password").set 'Teste123'
    find("#password-confirmation").set 'Teste123'
    check 'is_subscribed'
    click_button 'Create an Account'
  end


end
