*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Saisir Username
    [Arguments]    ${username}
    Input Text    id:user-name    ${username}
    
Saisir Password
    [Arguments]    ${password}
    Input Password    id:password    ${password}
    
Click Login
    Click Button    id:login-button  

    

Get Home Pages
    ${txt}    Get Text    css:.title
    [Return] ${txt}
    
    
Vérifier Message Erreur
    [Arguments]    ${expected_message}    ${locator}=css:.error-message-container
    ${error_msg}=    Get Text    ${locator}
    Should Be Equal As Strings    ${error_msg}    ${expected_message}
    
    