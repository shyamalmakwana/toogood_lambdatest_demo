*** Settings ***
Documentation   E2E test

Resource        ${EXECDIR}/TestSetup.robot
Resource        ${EXECDIR}/src/page/loginPage.robot
Resource        ${EXECDIR}/src/page/homePage.robot

Test Setup      Lambda Setup For Native App Parallel Execution
Test Teardown   Teardown Test

Force Tags      login

*** Test Cases ***
[TC-1] The Staff User Should Login Piersight App Successfully
    [Documentation]    Test case demo 1
    [Tags]      smoke    login
    When The Staff User "STAFF" Login The Piersight App
    Then The Homepage Is Displayed

[TC-2] The Staff User Should Logout Piersight App Successfully
    [Tags]      smoke    login
    [Documentation]    Test case demo 2
    When The Staff User "STAFF" Login The Piersight App
    Then The Homepage Is Displayed
    And The User Sign Out Persight Mobile App
    And The Log In Screen Should Be Displayed

[TC-3] The Investor User Should Login Piersight App Successfully
    [Documentation]    Test case demo 3
    [Tags]      smoke    login
    When The Investor User "${INVESTOR1}" Login The Piersight App
    Then The Homepage Is Displayed

[TC-4] The Investor User Should Logout Piersight App Successfully
    [Tags]      smoke    login
    [Documentation]    Test case demo 4
    When The Investor User "${INVESTOR2}" Login The Piersight App
    Then The Homepage Is Displayed
    And The User Sign Out Persight Mobile App
    And The Log In Screen Should Be Displayed
