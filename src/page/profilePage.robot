*** Settings ***
Documentation   Store attributes and actions of Profile Page

Resource        ${EXECDIR}/src/step/baseSteps.robot

*** Variables ***
${txt_username_login_mobile}
${txt_password_login_mobile}

*** Keywords ***
The Username Input Username On Mobile
    [Arguments]  ${username}
    Input Text   ${txt_username_login_mobile}    ${username}

The Username Input Passord On Mobile
    [Arguments]  ${password}
    Input Text   ${txt_password_login_mobile}    ${password}

