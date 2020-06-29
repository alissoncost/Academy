
Quando('entro para efetuar meu cadastro') do
    click_link_or_button 'Create an Account'
end

Quando('preencho os campos solicitados') do
  find("#firstname").set FFaker::NameBR.first_name
  find("#lastname").set FFaker::NameBR.last_name
  check 'is_subscribed'
  find("#email_address").set FFaker::Internet.disposable_email
  find("#password").set 'Teste123'
  find("#password-confirmation").set 'Teste123'
  click_button 'Create an Account'
end

Então('devo ver minha conta logada') do
  assert_text 'Thank you for registering with Main Website Store.'
end