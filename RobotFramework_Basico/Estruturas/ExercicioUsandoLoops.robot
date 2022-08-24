*** Settings ***
Documentation   Vamos aprender a fazer LOOPS usando o Robot Framework!!

*** Variables ***
### Indíce da lista
@{MINHA_LISTA}  0  1  2  3  4  5  6  7  8  9  10

*** Test Case ***

Teste de FOR do tipo IN
    [Documentation]  Faz um loop percorrendo a lista que você passar
    Usando FOR IN

*** Keywords ***
Usando FOR IN
    Log To Console    ${\n}
    FOR  ${NUMEROS}  IN  @{MINHA_LISTA}
        IF  ${NUMEROS} == 5 or ${NUMEROS} == 10
            Log To Console    Eu sou o número ${NUMEROS}! 
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10! Eu sou o número: ${NUMEROS}! 
        END
    END
