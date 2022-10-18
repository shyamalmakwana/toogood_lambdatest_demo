*** Settings ***
Documentation   As I an User, I would like to view

Resource      ${EXECDIR}/TestSetup.robot
Resource      ${EXECDIR}/src/page/loginPage.robot
Resource      ${EXECDIR}/src/page/homePage.robot

Test Setup       Lambda Setup For Native App Parallel Execution
Test Teardown    Teardown Test

Force Tags      porfolio


*** Test Cases ***
The Porfolio Summary Should Be Calculated Correctly
    [Tags]  smoke
    Given The Staff User "STAFF" Login The Piersight App
    And The User Sign Out Persight Mobile App
    When I Select As Of Date "2022/08/06" For Display
    Then The Value Of Cash & Equivalents Should Be  $49.42K
    And The Value Of Other Assets Should Be   $32.55K
    And The Total Market Value Should Be Calculated Correctly

# The Porfolio Summary Should Be Calculated Correctly
#     [Tags]  smoke
#     ${appPackage}     Set Variable    com.piersight.mobile.dev.v2
#     ${appActivity}    Set Variable    com.piersight.mobile.phw.MainActivity
#     @{androids}       Create List     ${android1}    ${android2}
#     FOR  ${android}  IN  @{androids}
#         Run Keyword If  ${android}!=${None}     Open Application    http://127.0.0.1:${android.appiumPort}/wd/hub
#         ...   platformName=Android
#         ...   appPackage=${appPackage}
#         ...   appActivity=${appActivity}
#         ...   noReset=false
#         ...   udid=${android.udid}
#         ...   systemPort=${android.systemPort}
#         ...   automationName=uiautomator2
#         ...   newCommandTimeout=10000
#         Given The Staff User Login The Piersight App
#         And The User Sign Out Persight Mobile App
#     END

    

    


