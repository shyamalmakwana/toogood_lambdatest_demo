*** Settings ***

Resource       ${EXECDIR}/src/step/baseSteps.robot
Resource       ${EXECDIR}/TestSetup.robot
 	    	

Test Setup     Open App Test
# Test Teardown  Execute Script    lamda-status=failed
Test Teardown  Teardown Test
 
*** Variables ***
${TIMEOUT}          3000

*** Test Cases ***
Android App Test On LambdaTest
	[Timeout]   ${TIMEOUT}

	AppiumLibrary.Click element  id=Browser
	AppiumLibrary.Input Text     id=url	https://lambdatest.com
	AppiumLibrary.Click element  id=find

	
#	Execute Script    lambda-status=passed
#	Execute Script    lambda-status=failed
	

#	AppiumLibrary.Click element  id=color
#	AppiumLibrary.Click element  id=Text
#	AppiumLibrary.Click element  id=toast
#	
#	Execute Script    lambda-status=passed
#	
#	AppiumLibrary.Click element  id=notification
#	AppiumLibrary.Click element  id=geoLocation
#	Sleep	2 seconds
# 	AppiumLibrary.Click element  id=Home
#	Sleep	2 seconds
#	AppiumLibrary.Click element  id=speedTest
#	Sleep	2 seconds

#	AppiumLibrary.Click element  id=Browser
#	AppiumLibrary.Input Text     id=url	https://lambdatest.com
#	AppiumLibrary.Click element  id=find
