#language: pt
Funcionalidade: Acesso a page para realizar um end to end.
@e2e
    Cenario: Finalizar uma compra com o usuario luma.
        Dado que estou navegando na 'URL'
        E realizo acesso com 'user_luma' e 'pass'
        Quando adiciono o item 'Advanced Pilates & Yoga (Strength)' ao carrinho
        E avanço para o checkout
        E preencho os dados de Shipping 
        E finalizo a compra
        Então vejo meu numero de pedido

        