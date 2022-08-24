*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Livros"
    [Documentation]    Esse teste verifica o menu Ofertas e Promoções do sita da Amazon.com.br
    ...                E verifica o título da página fica "Ofertas e Promoções    
    [Tags]             menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Livros"
    Então verificar se aparece a frase "Ofertas e Promoções"
    E o título da página fica "Ofertas e Promoções | Amazon.com.br"
    E aparece "Ofertas do Dia"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página