*** Settings ***
Library    RequestsLibrary


Suite Setup    Criar sessão
Suite Teardown    Encerrar sessão

*** Variables ***



*** Test Cases ***


Teste - CRUD
    
    ${USER_ID}    Criação de Usuario
    Busca de Usuario    USER_ID=${USER_ID}
    Atualizar Usuario    USER_ID=${USER_ID}
    Busca de Usuario    USER_ID=${USER_ID}
    Deletar Usuario    USER_ID=${USER_ID}
    
*** Keywords ***
Criação de Usuario
    ${header}    Create Dictionary    Content-Type=application/json
    ${RESPONSE}    POST On Session    alias=api        url=/usuarios    headers=${header}    data={"nome": "Fulano da Silva","email": "beltrano@qa1.com.br","password": "teste","administrador": "true"}
    ${USER_ID}    Set Variable    ${RESPONSE.json()['_id']}

    RETURN       ${USER_ID}
Busca de Usuario
    [Arguments]    ${USER_ID}
    ${RESPONSE}    GET On Session    alias=api        url=/usuarios/${USER_ID}
    ${RETORNO}    Set Variable    ${RESPONSE.json()}

Atualizar Usuario
    [Arguments]    ${USER_ID}
    ${header}    Create Dictionary    Content-Type=application/json
    ${RESPONSE}    PUT On Session    alias=api    url=/usuarios/${USER_ID}    headers=${header}    data={"nome": "Matheus Sodre","email": "matheus.qa@qa1.com.br","password": "teste","administrador": "true"}
    ${RETORNO}    Set Variable    ${RESPONSE.json()} 
Deletar Usuario
    [Arguments]    ${USER_ID}
    DELETE On Session    alias=api    url=/usuarios/${USER_ID}

Criar sessão
    Create Session    alias=api    url=https://serverest.dev
Encerrar sessão
    Delete All Sessions
