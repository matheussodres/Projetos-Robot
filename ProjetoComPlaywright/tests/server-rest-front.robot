*** Settings ***

Resource    ../resources/server-rest-front.resource


*** Test Cases ***
Login com sucesso
    Abrir o navegador
    Ir para o Site
    Preencher os dados do novo usuário e cadastrar