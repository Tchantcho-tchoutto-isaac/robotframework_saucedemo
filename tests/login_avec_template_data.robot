*** Settings ***
Resource    ../templates/login_template.robot
Library     DataDriver     users.csv    dialect=excel    encoding=utf-8
Test Template    Login Avec Cridentials Corrects
Test Setup       Open Browser    http://www.saucedemo.com    browser=chrome    remote_url=http://localhost:4444/wd/hub
Test Teardown    Close Browser

*** Test Cases ***

Login Avec Cridentials Corrects    ${username}    ${password}
    [Tags]    @regresssion

*** Keywords ***
Login Avec Cridentials Corrects
    [Arguments]    ${username}    ${password}
    Log To Console    ${username} ${password}
    [Return]    ${username}    ${password}