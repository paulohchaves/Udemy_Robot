*** Settings ***
Documentation   documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library         RequestsLibrary 
Library         Collections
Library    DateTime

*** Variables ***
${URL}          https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}      ID=15  
...             Title=Book 15  
...             PageCount=1500
&{NOVO_LIVO}    ID=1234  
...             Title=Teste 
...             Description=Teste
...             PageCount=200
...             Excerpt=Teste
&{BOOK_1}       ID=1  
...             Title=Teste 
...             Description=Teste
...             PageCount=123
...             Excerpt=Teste

*** Keywords ***
#### Setup e Teardown
Conectar a minha API         
     Create Session    fakeAPI    ${URL}

#### Ações
Requisitar todos os livros
     ${RESPOSTA}    Get Request    fakeAPI    Books
     Log            ${RESPOSTA.text}
     Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
     ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
     Log            ${RESPOSTA.text}
     Set Test Variable    ${RESPOSTA}
     
#### Conferências
Conferir o status code
    [Arguments]    ${STATUCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUCODE_DESEJADO}

Conferir o reason  
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTD_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTD_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id             ${BOOK_15.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title          ${BOOK_15.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount      ${BOOK_15.PageCount}
    Should Not Be Empty    ${RESPOSTA.json()["description"]};
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]} 

Cadastrar um novo livro
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    Post Request    fakeAPI    Books
    ...                            data={"id": 1234, "title": "Teste", "description": "Teste", "pageCount": 200, "excerpt": "Teste", "publishDate": "2022-06-30T17:48:05.775Z"}
    ...                            headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    
Conferir se retorna todos os dados cadastrados para o novo livro
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id             ${NOVO_LIVO.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title          ${NOVO_LIVO.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${NOVO_LIVO.Description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount      ${NOVO_LIVO.PageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt        ${NOVO_LIVO.Excerpt}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]} 

Alterar o livro "${ID_LIVRO}"
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    Put    fakeAPI    Books/${ID_LIVRO}   
    ...                   data={"id": ${ID_LIVRO}, "title": "Teste", "description": "Teste", "pageCount": 123, "excerpt": "Teste", "publishDate": "2022-07-18T15:29:15.658Z"}
    ...                   headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id             ${BOOK_1.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title          ${BOOK_1.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${BOOK_1.Description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount      ${BOOK_1.PageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt        ${BOOK_1.Excerpt}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]} 
    
Excluir o livro "${ID_LIVRO}"
    ${RESPOSTA}    DELETE     fakeAPI    Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Conferir se excluiu o livro "${ID_LIVRO}"
    Should Be Empty     ${RESPOSTA.content}
    