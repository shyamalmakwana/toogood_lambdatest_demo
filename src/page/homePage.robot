*** Settings ***
Documentation   Attributes and actions of Login Page

Resource        ${EXECDIR}/src/step/baseSteps.robot
Library         ${EXECDIR}/src/utilities/string_utilities.py

*** Variables ***
${icon_portfolio_home_mobile}        xpath=//android.widget.ImageView[@index='0']
${label_portfolio_summary_mobile}    xpath=//android.widget.TextView[@text='All Investments']
${label_investments_home_mobile}     xpath=//android.widget.TextView[@text='Investments']
${label_documents_home_mobile}       xpath=//android.widget.TextView[@text='Documents']
${label_profile_home_mobile}         xpath=//android.widget.TextView[@text='Profile' and @index='1']
${profile_moreoptions_home_mobile}   xpath=//android.widget.TextView[@text='More options']
${profile_editprofile_home_mobile}   xpath=//android.widget.TextView[@text='Edit profile']
${profile_2fasettings_home_mobile}   xpath=//android.widget.TextView[@text='2FA Settings']
${profile_language_home_mobile}      xpath=//android.widget.TextView[@text='Language preference']
${profile_help_home_mobile}          xpath=//android.widget.TextView[@text='Help & Feedback']
${profile_signout_home_mobile}       xpath=//android.widget.TextView[@text='Sign out']
${as_of_date_mobile}                 xpath=//*[contains(@text,'As of date')]
${select_date_mobile}                xpath=//android.widget.EditText[@index='0']
${btn_select_date_mobile}            xpath=//android.widget.TextView[@text='OK']
${cash_equi_portforlio_mobile}       xpath=//android.widget.TextView[@text='$49.42K']
${other_assets_portforlio_mobile}    xpath=//android.widget.TextView[@text='$32.55K']
${total_market_portforlio_mobile}    xpath=//android.widget.TextView[@text='$81,965.35' and @index='0']


*** Keywords ***
The Homepage Is Displayed
    [Documentation]     Verify that the Homepage is open correctly
    AppiumLibrary.Wait Until Element Is Visible   ${label_portfolio_summary_mobile}
    AppiumLibrary.Element Text Should Be          ${label_portfolio_summary_mobile}   All Investments
    AppiumLibrary.Element Text Should Be          ${label_Investments_home_mobile}    Investments
    AppiumLibrary.Element Text Should Be          ${label_profile_home_mobile}        Profile

The Homepage Of Investor Published Documents Is Displayed
    [Documentation]     Verify that the Homepage is open correctly
    AppiumLibrary.Wait Until Element Is Visible   ${label_portfolio_summary_mobile}
    AppiumLibrary.Element Text Should Be          ${label_portfolio_summary_mobile}   All Investments
    AppiumLibrary.Element Text Should Be          ${label_investments_home_mobile}    Investments
    AppiumLibrary.Element Text Should Be          ${label_documents_home_mobile}      Documents
    AppiumLibrary.Element Text Should Be          ${label_profile_home_mobile}        Profile
    Capture Page Screenshot

I Open Profile Options In Home Page
    [Documentation]    Click on the Profile in HomePage for More Options menu
    AppiumLibrary.Wait Until Element Is Visible   ${label_profile_home_mobile}
    Tap                             ${label_profile_home_mobile}

The User Sign Out Persight Mobile App
    [Documentation]    Sign out the Persight Mobile BACKGROUND APP
    I Open Profile Options In Home Page
    I Click On "Sign out" Option

I Click On "${optionitem}" Option
    [Documentation]    Open Profile option and click on the ${optionitem}
    AppiumLibrary.Wait Until Page Contains    ${optionitem}
    Run Keyword If   '${optionitem}'=='Edit profile'          Click Text    Provision Sensors
    Run Keyword If   '${optionitem}'=='2FA Settings'          Click Text    2FA Settings
    Run Keyword If   '${optionitem}'=='Language preference'   Click Text    Language preference
    Run Keyword If   '${optionitem}'=='Help & Feedback'       Click Text    Help & Feedback
    Run Keyword If   '${optionitem}'=='Sign out'              Click Text    Sign out

I Select As Of Date "${date}" For Display
    AppiumLibrary.Wait Until Element Is Visible        ${label_portfolio_summary_mobile}    timeout=10s
    Wait Until Visible And Tab                         ${as_of_date_mobile}
    Wait Until Visible And Tab                         ${select_date_mobile}
    Wait Until Element Is Visible And Input Text       ${select_date_mobile}       ${date}
    Wait Until Element Is Visible And Click Element    ${btn_select_date_mobile}
    Wait Until Element Is Visible And Click Element    ${btn_select_date_mobile}

The Value Of Cash & Equivalents Should Be
    [Arguments]     ${cash_equivelent_value}
    AppiumLibrary.Wait Until Element Is Visible   ${cash_equi_portforlio_mobile}   timeout=10s
    Log To Console    ${cash_equi_portforlio_mobile}
    AppiumLibrary.Element Text Should Be          ${cash_equi_portforlio_mobile}      ${cash_equivelent_value}

The Value Of Other Assets Should Be
    [Arguments]     ${other_assets_expected}
    AppiumLibrary.Wait Until Element Is Visible   ${other_assets_portforlio_mobile}
    AppiumLibrary.Element Text Should Be          ${other_assets_portforlio_mobile}   ${other_assets_expected}

The Total Market Value Should Be Calculated Correctly
    Wait Until Element Is Visible             ${cash_equi_portforlio_mobile}
    ${cash}            Get Text               ${cash_equi_portforlio_mobile}
    ${assets}          Get Text               ${other_assets_portforlio_mobile}
    ${total_market}    Get Text               ${total_market_portforlio_mobile}
    ${convert_cash}    Convert Money Mobile   ${cash}
    ${convert_assets}  Convert Money Mobile   ${assets}
    ${total}           Convert Money          ${total_market}
    ${sum_money}       Sum Money              ${convert_cash}   ${convert_assets}
    Should Be Equal    ${sum_money}           ${total}          The Total Market Value Is Calculated Incorrectly
