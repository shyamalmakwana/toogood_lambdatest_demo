*** Settings ***

Library           SeleniumLibrary
Resource          ${EXECDIR}/TestSetup.robot

Suite Teardown    Teardown Test For Web

*** Variables ***
${TIMEOUT}        3000


*** Test Cases ***
Mobile Web Test On LambdaTest
    [Tags]      mobileweb
    [Timeout]   ${TIMEOUT}
	Open Mobile Web  https://lambdatest.github.io/sample-todo-app/
#	SeleniumLibrary.Page Should Contain  LambdaTest Sample App
#	SeleniumLibrary.Click Button  name:li1	
#	SeleniumLibrary.Click Button  name:li2	
#	SeleniumLibrary.Input Text    id:sampletodotext  Let's add them to list
#	SeleniumLibrary.Click Button  id:addbutton

	Page should contain element  name:li1
	Page should contain element  name:li2

	Click button  name:li1	
	Click button  name:li2	
		
	Input text  id:sampletodotext  Yey Let's add it to list
	Click button  id:addbutton
	${response}    Get Text    xpath=/html/body/div/div/div/ul/li[6]/span
	Should Be Equal As Strings    ${response}    Yey Let's add it to list


Login Piersight On Mobile Web
    [Tags]      mobileweb
    Open Mobile Web    https://dev5-phw-login.piersight.com/login
	SeleniumLibrary.Input Text      //input[@id='cosmos-login-form-user-name-field']   ${STAFF}
	SeleniumLibrary.Input Text      //input[@id='cosmos-login-form-password-field']    ${PASSWORD}
	SeleniumLibrary.Click Button    //ps-button[@id='cosmos-login-form-login-btn']


*** Keywords ***
Teardown Test For Web
    [Documentation]    release setup and close the application
     Run Keyword If    '${REMOTE_URL}' != ''
    	...    Execute Script    lambda-status=passed
    SeleniumLibrary.Close All Browsers
