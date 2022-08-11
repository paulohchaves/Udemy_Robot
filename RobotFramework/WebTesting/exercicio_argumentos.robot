*** Settings ***
Documentation     Exemplos de tipos de tipos de variáveis como argumentos em Keywords
Library    String  

*** Variables ***
#Dicionário
&{PESSOA}  Nome=Paulo   Sobrenome=Chaves

*** Test Cases ***
Exercicio usando argumentos
   Exercicio argumentos

*** Keywords ***   
Exercicio argumentos
    Imprimindo um e-mail customizado e aleatório    ${PESSOA.Nome}  ${PESSOA.Sobrenome}

Imprimindo um e-mail customizado e aleatório
    [Arguments]  ${NOME_USUARIO}  ${SOBRE_NOME}
    ${FRASE_ALEATORIA}  Generate Random String
    Log    O email é: ${NOME_USUARIO}${SOBRE_NOME}${FRASE_ALEATORIA}@testerobot.com

# Exercicio email customizado
#     Uma subkeyword com argumentos  ${PESSOA.Nome}  ${PESSOA.Sobrenome}
#     ${MENSAGEM_ALERTA}  Uma subkeyword com retorno  ${PESSOA.Nome}  ${PESSOA.Idade}
#     Log  ${MENSAGEM_ALERTA}

# Uma subkeyword com argumentos
#     [Arguments]  ${NOME_USUARIO}  ${SOBRE_NOME}


# Uma subkeyword com retorno
#     [Arguments]  ${NOME_USUARIO}  ${IDADE_USUARIO}
#     ${MENSAGEM}  Set Variable If  ${IDADE_USUARIO}<18  Não autorizado!! O usuário ${NOME_USUARIO} é menor.
#     [Return]  ${MENSAGEM}