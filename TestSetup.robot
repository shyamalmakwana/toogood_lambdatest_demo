*** Settings ***
Documentation    Setup step before execution test

# Library     SeleniumLibrary
Library     Selenium2Library
Library     ${EXECDIR}/src/utilities/lambdaKeyword.py


Resource    ${EXECDIR}/src/step/baseSteps.robot


*** Keywords ***
Open App Test
    Open Application   ${REMOTE_URL}  
    ...    platformName=${platformName}
    ...    platformVersion=${platformVersion}
    ...    deviceName=${deviceName}
    ...    visual=${visual}
    ...    network=${network}
    ...    isRealMobile=${isRealMobile}
    ...    app=${app}
    ...    name=Native App Test
    ...    build=Appium Python Robot

Open Mobile Web
    [Documentation]    Open mobile web browser with given url
    [Arguments]    ${url}
    ${mobileWebCapilities}    Create Dictionary    browserName=${browserName}
    ...    platformName=${platformName}
    ...    platformVersion=${platformVersion}
    ...    deviceName=${deviceName}
    ...    visual=${visual}
    ...    network=${network}
    ...    console=${console}
    ...    w3c=${True}
    ...    isRealMobile=${isRealMobile}
    ...    name=Mobile Web Test
    Selenium2Library.Open Browser     ${url}
    ...    browser=${browserName}
    ...    remote_url=${REMOTE_URL}
    ...    desired_capabilities=${mobileWebCapilities}

Lambda Setup For Native App Parallel Execution
    [Documentation]     Setup LambdaTest for parallel execution   
    ${valuesetname}=      Acquire Value Set
    Log                   ${valuesetname}
    ${platformName}=      Get Value From Set   platformName
    ${platformVersion}=   Get Value From Set   platformVersion
    ${deviceName}=        Get Value From Set   deviceName
    ${isRealMobile}=      Get Value From Set   isRealMobile
    ${visual}=            Get Value From Set   visual
    ${network}=           Get Value From Set   network
    ${console}=           Get Value From Set   console
    ${app}=               Get Value From Set   app
    Open Application  ${REMOTE_URL}
    ...  platformName=${platformName}
    ...  platformVersion=${platformVersion}
    ...  deviceName=${deviceName}
    ...  visual=${visual}  network=${network}
    ...  isRealMobile=${isRealMobile}
    ...  app=${app}
    ...  name=Different TCs Executed Parallel On Different Devices
    ...  build=Appium Python Robot

Local Setup For Parallel Execution
    [Documentation]     setup for parallel test execution   
    ${valuesetname}=   Acquire Value Set
    Log     ${valuesetname}
    ${udid}=      Get Value From Set   udid
    Set Global Variable    ${udid}
    Log   ${udid}
    ${appiumPort}=     Get Value From Set   appium_port
    Set Global Variable    ${appiumPort}
    Log     ${appiumPort}
    ${systemPort}=     Get Value From Set   system_port
    Set Global Variable    ${systemPort}
    Log     ${systemPort}
    ${appPackage}       Set Variable   com.google.android.calculator
    ${appActivity}      Set Variable   com.android.calculator2.Calculator
    ${appiumServer}     Set Dynamic    ${LOCAL_URL}    ${appiumPort}
    Open Application
    ...   ${appiumServer}
    ...   platformName=Android
    ...   appPackage=${appPackage}
    ...   appActivity=${appActivity}
    ...   noReset=false
    ...   udid=${udid}
    ...   systemPort=${systemPort}
    ...   automationName=uiautomator2
    ...   newCommandTimeout=10000

Setup Multiple Android Devices
    [Documentation]    setup for test execution on multiple android device
    [Arguments]       ${device1}    ${device2}    ${device3}=${None}
    ${appPackage}     Set Variable    com.piersight.mobile.dev.v2
    ${appActivity}    Set Variable    com.piersight.mobile.phw.MainActivity
    @{devices}        Create List     ${device1}     ${device2}    ${device3}
    FOR  ${device}  IN  @{devices}
        Run Keyword If    ${device}!=${None}    Open Application    http://127.0.0.1:${device.appiumPort}/wd/hub
        ...   platformName=Android
        ...   appPackage=${appPackage}
        ...   appActivity=${appActivity}
        ...   noReset=false
        ...   udid=${device.udid}
        ...   systemPort=${device.systemPort}
        ...   automationName=uiautomator2
        ...   newCommandTimeout=10000
    END

# Setup Multiple iOS Devices For Execution
#     [Documentation]    setup for test execution on multiple android device
#     [Arguments]     ${device1}    ${device2}    ${device3}=${None}
#     @{devices}    Create List    ${device1}    ${device2}    ${device3}
#     FOR  ${device}  IN  @{devices}
#         Run Keyword If    ${device}!=${None}    Open Application    ${device.appiumServer}
#        ...  platformName=${device.PLATFORM}
#        ...  platformVersion=${device.PLATFORM_VERSION}
#        ...  deviceName=${device.DEVICE_NAME}
#        ...  app=${device.APP}
#        ...  udid=${device.UDID}
#        ...  alias=${device.KEY}
#        ...  newCommandTimeout=19000
#        ...  fullReset=false
#        ...  noReset=true
#        ...  showIOSLog=true
#        ...  preventWDAAttachments=true
#        ...  keepKeyChains=true
#        ...  xcodeOrgId=${device.TEAMID}
#        ...  xcodeSigningId=iPhone Developer
#        ...  WDALOCALPORT=${device.WDALOCALPORT}
#     END

Teardown Test
    [Documentation]    release setup and close the application
    Release value set
    Close Application

Teardown Test And Report
    [Documentation]    release setup, close the application and report test result
    Release value set
    Run Keyword If    '${REMOTE_URL}' != ''   Report Lambdatest Status
    ...    ${TEST_NAME}    ${TEST_STATUS}
    Close Application
