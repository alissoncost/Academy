class Cadastro
  include Capybara::DSL

  def access_create_account
    click_link_or_button 'Create an Account'
  end

  def create_account
    find(EL["create_name"]).set FFaker::NameBR.first_name
    find(EL["create_lastname"]).set FFaker::NameBR.last_name
    find(EL["create_email"]).set FFaker::Internet.disposable_email
    find(EL["create_pass"]).set 'Teste123'
    find(EL["create_conf_pass"]).set 'Teste123'
    check 'is_subscribed'
    click_button EL["bttn_create"]
  end

end
