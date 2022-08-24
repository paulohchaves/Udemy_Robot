*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${BROWSER}               chrome
${URL}                   http://www.amazon.com.br/
${MENU_OFERTA}           //a[contains(.,'Ofertas do Dia')]
${HEADER_OFERTA}         //h1[@class='a-size-extra-large a-spacing-micro'][contains(.,'Ofertas e Promoções')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_OFERTA}

Entrar no menu "Livros"
    Click Element    locator=${MENU_OFERTA}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_OFERTA}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece "${OFERTAS}"
    Element Should Be Visible    locator=//span[@class='nav-a-content'][contains(.,'${OFERTAS}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Click Element    locator=twotabsearchtextbox 
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
  Scroll Element Into View    locator=//img[@alt='${PRODUTO}']
  Click Element    locator=//img[@alt='${PRODUTO}']
  Click Element    locator=//a[contains(@title,'Ver todas as opções de compra')]
  Wait Until Element Is Visible    locator=submit.addToCart
  Click Element    locator=submit.addToCart
  Click Element    locator=//i[contains(@class,'a-icon a-icon-close a-icon-medium aod-close-button')]

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='nav-cart-count nav-progressive-attribute nav-progressive-content nav-cart-1']
    Click Element    locator=nav-cart
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')] 

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]


#Gherkin Steps

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Livros"
    Entrar no menu "Livros"

Então verificar se aparece a frase "Ofertas e Promoções"
    Verificar se aparece a frase "Ofertas e Promoções"

E o título da página fica "Ofertas e Promoções | Amazon.com.br"
    Verificar se o título da página fica "Ofertas e Promoções | Amazon.com.br"

E aparece "Ofertas do Dia"
    Verificar se aparece "Ofertas do Dia"
    Verificar se aparece "Loja de Cupons"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S" 