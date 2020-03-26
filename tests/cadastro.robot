*** Settings ***
Documentation       Cadastro de jogos

Library     SeleniumLibrary

# BDD (Desenvolvimento guiado por comprtamento)

*** Test Cases ***
Cadastrar novo jogo
    #Valor agregado
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    Então vejo a mensagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista

*** Keywords ***
Dado que acesso o portal de cadastro de jogos
    Open Browser                    http://localhost:3000/      chrome
    Set Selenium Implicit Wait      5
    Click Link                      /produtos/new

Quando eu faço o cadastro de um novo jogo
    Input Text          id:produto_nome             Call of Duty
    Input Text          id:produto_descricao        Um jogo de primeira pessoal muito bacana    
    Input Text          id:produto_preco            99.99
    Input Text          id:produto_quantidade       10

    Click Element       xpath://input[@value='Criar Produto']

Então vejo a mensagem de sucesso "${mensagem_esperda}"
    Element Should Contain          css:div[role=alert]     ${mensagem_esperda}

E vejo este novo jogo na lista    
    Elemente Should Contain         id:table_list           Call of Duty