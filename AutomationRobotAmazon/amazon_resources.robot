*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${URL}                    https://www.amazon.com.br/
${MENU_ELETRONICOS}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}     //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_ELETRONICO}       Eletrônicos e Tecnologia


*** Keywords ***

Abrir o navegador
    Open Browser        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessando a plataforma Amazon
    Go To                                        url=${URL}
    Wait Until Element Is Visible                locator=${MENU_ELETRONICOS}

Entrar no menu "Eletronicos"
    Click Element                    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${TEXTO_ELETRONICO} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o titulo da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]


Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text    locator=//input[contains(@id,'twotabsearchtextbox')]    text=${PRODUTO}

Clicar no botão Pesquisa
    Click Element    locator=//input[contains(@id,'nav-search-submit-button')]

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    