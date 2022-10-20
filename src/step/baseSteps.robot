*** Settings ***
Documentation   Common keywords are used for Mobile Testing
Library         AppiumLibrary    timeout=30
#Library         AppiumLibrary    timeout=30   run_on_failure=No Operation
Library         OperatingSystem
Library         String
Library         Collections
Library         Process
Library         pabot.PabotLib

Resource        ${EXECDIR}/src/data/deviceInfo.robot


*** Keywords ***
Set Dynamic
    [Documentation]    Set a dynamic parameter for locator
    [Arguments]    ${element}    ${value}
    ${locator}=    Format String    ${element}    ${value}
    RETURN    ${locator}

Click Button "${buttontext}"
    [Documentation]    Click button  ${buttontext}
    Wait Until Text Is Visible And Click Text    ${buttontext}

Wait Until Element Is Visible And Click Element
    [Documentation]    Wait until element is visible then click element
    [Arguments]      ${locator}
    AppiumLibrary.Wait Until Element Is Visible   ${locator}
    Click Element                   ${locator}

Wait Until Element Is Visible And Click Button
    [Documentation]    Wait until element is visible then click button
    [Arguments]                     ${locator}
    AppiumLibrary.Wait Until Element Is Visible   ${locator}
    Click Button                    ${locator}

Wait Until Visible And Tab
    [Documentation]    Wait until element is visible then click button
    [Arguments]                     ${text}
    AppiumLibrary.Wait Until Element Is Visible   ${text}
    Tap                             ${text}

Wait Until Text Is Visible And Click Text
    [Documentation]    Wait until element is visible then click button
    [Arguments]                     ${text}
    AppiumLibrary.Wait Until Page Contains        ${text}
    Click Text                      ${text}

Wait until element is visible and input text
    [Documentation]    Wait until element is visible then input text into the element text field
    [Arguments]      ${locator}     ${text_value}
    AppiumLibrary.Wait Until Element Is Visible   ${locator}
    Clear Text                      ${locator}
    AppiumLibrary.Input Text        ${locator}    ${text_value}
    Hide Keyboard

