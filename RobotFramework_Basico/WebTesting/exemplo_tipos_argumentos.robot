*** Settings ***
Documentation     Exemplos de tipos de tipos de variáveis como argumentos em Keywords

*** Variables ***
#Dicionário
&{PESSOA}  Nome=Paulo Henrique   Email=paulo@teste.com.br   Idade=12   Sexo=masculino

*** Test Cases ***
Aprendendo a usar variáveis
   Teste imprimindo os tipos de variaveis como argumentos

*** Keywords ***    
Teste imprimindo os tipos de variaveis como argumentos
    Uma subkeyword com argumentos  ${PESSOA.Nome}  ${PESSOA.Email}
    ${MENSAGEM_ALERTA}  Uma subkeyword com retorno  ${PESSOA.Nome}  ${PESSOA.Idade}
    Log  ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]  ${NOME_USUARIO}  ${EMAIL_USUARIO}
    Log  Nome usuário: ${NOME_USUARIO}
    Log  Email usuário: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]  ${NOME_USUARIO}  ${IDADE_USUARIO}
    ${MENSAGEM}  Set Variable If  ${IDADE_USUARIO}<18  Não autorizado!! O usuário ${NOME_USUARIO} é menor.
    [Return]  ${MENSAGEM}