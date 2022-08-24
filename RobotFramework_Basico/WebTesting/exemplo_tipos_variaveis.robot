*** Settings ***
Documentation     Exemplos de tipos de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS.

*** Variables ***
#Simples
${GLOBAL_SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Lista
@{FRUTAS}           Morango   Banana   Maça   Uva   Abacaxi!

@{MES_ANO}          Janeiro  Fevereiro  Março  Abril  Maio  Junho  Julho  Agosto  Setembro  Outubro  Novembro  Dezembro 

#Dicionário
&{PESSOA}           Nome=Paulo Henrique   Email=paulo@teste.com.br   Idade=32   Sexo=masculino

&{DIA_POR_MES}      Janeiro=31 dias
              ...   Fevereiro=28 dias
              ...   Marco=31 dias
              ...   Abril=30 dias
              ...   Maio=31 dias
              ...   Junho=30 dias
              ...   Julho=31 dias
              ...   Agosto=31 dias
              ...   Setembro=30 dias
              ...   Outubro=31 dias
              ...   Novembro=30 dias
              ...   Dezembro=31 dias

*** Test Cases ***
Aprendendo a usar variáveis
   Teste imprimindo os tipos de variaveis
   Teste imprimindo os meses do ano
   Teste imprimindo os meses e dias do ano

*** Keywords ***    
Teste imprimindo os tipos de variaveis
    #Simples
    Log     ${GLOBAL_SIMPLES}
    #Lista
    Log     Tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}
    #Dicionário
    Log     Nome: ${PESSOA.Nome} e email: ${PESSOA.Email}

Teste imprimindo os meses do ano
    Log To Console  Mês 01: ${MES_ANO[0]}
    Log To Console  Mês 02: ${MES_ANO[1]}
    Log To Console  Mês 03: ${MES_ANO[2]}
    Log To Console  Mês 04: ${MES_ANO[3]}
    Log To Console  Mês 05: ${MES_ANO[4]}
    Log To Console  Mês 06: ${MES_ANO[5]}
    Log To Console  Mês 07: ${MES_ANO[6]}
    Log To Console  Mês 08: ${MES_ANO[7]}
    Log To Console  Mês 09: ${MES_ANO[8]}
    Log To Console  Mês 10: ${MES_ANO[9]}
    Log To Console  Mês 11: ${MES_ANO[10]}
    Log To Console  Mês 12: ${MES_ANO[11]}

Teste imprimindo os meses e dias do ano
    Log To Console  Em Janeiro tem: ${DIA_POR_MES.Janeiro}
    Log To Console  Em Fevereiro tem: ${DIA_POR_MES.Fevereiro}
    Log To Console  Em Marco tem: ${DIA_POR_MES.Marco}
    Log To Console  Em Abril tem: ${DIA_POR_MES.Abril}
    Log To Console  Em Maio tem: ${DIA_POR_MES.Maio}
    Log To Console  Em Junho tem: ${DIA_POR_MES.Junho}
    Log To Console  Em Julho tem: ${DIA_POR_MES.Julho}
    Log To Console  Em Agosto tem: ${DIA_POR_MES.Agosto}
    Log To Console  Em Setembro tem: ${DIA_POR_MES.Setembro}
    Log To Console  Em Outubro tem: ${DIA_POR_MES.Outubro}
    Log To Console  Em Novembro tem: ${DIA_POR_MES.Novembro}
    Log To Console  Em Dezembro tem: ${DIA_POR_MES.Dezembro}
