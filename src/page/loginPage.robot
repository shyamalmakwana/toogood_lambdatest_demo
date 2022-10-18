*** Settings ***
Documentation       Store attributes and actions of Login Page

Resource    ${EXECDIR}/src/step/baseSteps.robot


*** Variables ***
${logo_porfolio_login_mobile}       xpath=//android.widget.ImageView[@index='0']
${txt_username_login_mobile}        xpath=//android.widget.EditText[@index='1']
${txt_password_login_mobile}        xpath=//android.widget.EditText[@text='Enter password here']
${btn_signin_login_mobile}          xpath=//android.widget.TextView[@text='Sign In']
${label_usrname_login_mobile}       xpath=//android.widget.TextView[@text='Username']
${label_pass_login_mobile}          xpath=//android.widget.TextView[@text='Password']
${label_forgotpass_login_mobile}    xpath=//android.widget.TextView[@text='Forgot Password?']


*** Keywords ***
I Input Username On Login Page
    [Arguments]  ${username}
    Wait until element is visible and input text   ${txt_username_login_mobile}   ${username}

I Input Password On Login Page
    [Arguments]  ${password}
    Wait until element is visible and input text   ${txt_password_login_mobile}    ${password}

I Submit Credentials
    Swipe    200    1916    200    1226    1000
    Wait Until Text Is Visible And Click Text  Sign In

The Staff User "${staff}" Login The Piersight App
    [Documentation]   The staff user should login the Piersight App successfully
    [Tags]    sensitive
    I Input Username On Login Page  ${staff}
    I Input Password On Login Page  ${PASSWORD}
    I Submit Credentials

The Investor User "${investor}" Login The Piersight App
    [Documentation]   The Investor user should login the Piersight App successfully
    [Tags]    sensitive
    I Input Username On Login Page  ${investor}
    I Input Password On Login Page  ${PASSWORD}
    I Submit Credentials

The Log In Screen Should Be Displayed
    [Documentation]    Verify that the Login page displays correctly
    AppiumLibrary.Wait Until Element Is Visible    ${label_usrname_login_mobile}
    Element Text Should Be     ${label_usrname_login_mobile}      Username
    Element Text Should Be     ${label_pass_login_mobile}         Password
    Element Text Should Be     ${btn_signin_login_mobile}         Sign In
    Element Text Should Be     ${label_forgotpass_login_mobile}   Forgot Password?
    Capture Page Screenshot
