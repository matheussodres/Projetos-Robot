*** Settings ***
Documentation    Essa suite testa o site da Zenvia
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador
 
*** Test Cases ***
Caso de Teste 01 - Acessando a Plataforma
    [Documentation]  Esse teste acesse o site da amazon
    [Tags]           menu categorias
    Acessando a plataforma Amazon
    Entrar no menu "Eletronicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o titulo da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de Teste 02 - Pesquisa da Produtos
    [Documentation]     Esse teste verificar a busca de um produto
    [Tags]              busca_produtos lista_busca

    Acessando a plataforma Amazon
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão Pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

