*** Settings ***
Documentation   documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource        ResourceAPI.robot
Suite Setup     Conectar a minha API  



*** Test Case ***
Buscar a listagem de todos o livros (Get em todos os livros)
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason   OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (Get em um livro específico)
    Requisitar o livro "15"
    Conferir o status code  200
    Conferir o reason   OK 
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados cadastrados para o novo livro

Alterar um livro (PUT)
    Alterar o livro "1"
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados alterados do livro "1"

Deletar um livro (DELETE)
    Excluir o livro "1234"
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se excluiu o livro "1234"