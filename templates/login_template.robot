*** Settings ***

Library    SeleniumLibrary
Resource    ../Pages/login.resource


*** Keywords ***

Login Avec Cridentials Corrects
    [Documentation]    Login avec credentials Corrects
    [Tags]    @regresssion @smoke
    [Arguments]    ${username}    ${password}
    Saisir Username     ${username}
    Saisir Password     ${password}    
    Click Login
    #Wait Until Element Is Visible    css:.title    timeout=5s
    ${txt}    Get Text    css:.title
    Should Be Equal As Strings    ${txt}    Products
    [Teardown]    Close Browser
