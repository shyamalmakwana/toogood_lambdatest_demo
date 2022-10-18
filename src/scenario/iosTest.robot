*** Settings ***

Resource       ${EXECDIR}/src/step/baseSteps.robot
Resource       ${EXECDIR}/TestSetup.robot

Test Setup     Open App Test
Test Teardown  Teardown Test
 
*** Variables ***
${TIMEOUT}          3000

*** Test Cases ***
iOS App Test On LambdaTest
	[Timeout]   ${TIMEOUT}
	AppiumLibrary.Click element  id=color
	AppiumLibrary.Click element  id=Text
	AppiumLibrary.Click element  id=toast
	AppiumLibrary.Click element  id=notification
	AppiumLibrary.Click element  id=geoLocation

