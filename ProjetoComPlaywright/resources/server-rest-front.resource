*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime

*** Variables ***
${BROWSER}     chromium
${HEADLESS}    ${false}
${SITE}        https://front.serverest.dev/



*** Keywords ***

Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    ${NOW}    Get Current Date    result_format=%d-%m-$Y_%H%M%S
    New Context    viewport={"width": 1200, "height": 800 }
    ...    recordVideo={"dir": '${OUTPUT_DIR}/evidencias/videos/${NOW}'}

Ir para o Site
    New Page       url=${SITE}

Preencher os dados do novo usuário e cadastrar
    Click         css=.btn-link

    ${EMAIL}      FakerLibrary.Email
    Set Test Variable    ${EMAIL}
    Fill Text     css=input[data-testid='nome']        txt=Matheus Sodré
    Fill Text     css=input[data-testid='email']       ${EMAIL}
    Fill Text     css=input[data-testid='password']    123456
    Check Checkbox    css=input[data-testid='checkbox']
    Click         css=button[data-testid='cadastrar']

    