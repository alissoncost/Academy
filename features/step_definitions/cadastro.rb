
Quando('entro para efetuar meu cadastro') do
    @cadastro.access_create_account
end

Quando('preencho os campos solicitados') do
  @cadastro.create_account
end

Então('devo ver minha conta logada') do
  assert_text 'Thank you for registering with Main Website Store.'
end
