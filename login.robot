*** Settings ***
Library    SeleniumLibrary
Library    .venv/Lib/site-packages/robot/libraries/XML.py
Library    .venv/Lib/site-packages/robot/libraries/String.py
Resource    Pages/login.resource


*** Test Cases ***
Login Avec Cridentials Corrects
    [Documentation]    Login avec credentials Corrects
    [Tags]    @regresssion @smoke
    Open Browser    https://www.saucedemo.com/    Chrome
    Saisir Username    standard_user
    Saisir Password    secret_sauce    
    Click Login
    #Wait Until Element Is Visible    css:.title    timeout=5s
    ${txt}    Get Text    css:.title
    Should Be Equal As Strings    ${txt}    Products
    [Teardown]    Close Browser

Login Avec Cridentials Incorrect Username
    [Documentation]    Login avec credentials Corrects
    [Tags]    @smoke
    Open Browser    https://www.saucedemo.com/    Chrome
    Saisir Username    standard_users
    Saisir Password    secret_sauce    
    Click Login
    #Wait Until Element Is Visible    css:.title    timeout=5s

    Vérifier Message Erreur    Epic sadface: Username and password do not match any user in this service
    Close Browser