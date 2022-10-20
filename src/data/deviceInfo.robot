*** Variables ***
####### DEVICE INFO #############################################
&{android3}    tags=device3    udid=R5CT91ZC2VY      appiumPort=4727    systemPort=8203
&{android2}    tags=device2    udid=emulator-5556    appiumPort=4725    systemPort=8202
&{android1}    tags=device1    udid=emulator-5554    appiumPort=4723    systemPort=8201

####### GLOBAL VARIABLE  ########################################
${STAFF}           hong.le@saigontechnology.com
${INVESTOR1}       hong.le+1@saigontechnology.com
${INVESTOR2}       hong.le+2@saigontechnology.com
${PASSWORD}        MyPassword1
# ${APP_LAMBDA}      lt://APP10160601531665714253969239
${APP_LAMBDA}      lt://APP10160202521666188016486486
${APP_PACKAGE}     com.piersight.mobile.dev.v2
${APP_ACTIVITY}    com.piersight.mobile.phw.MainActivity
${USERNAME}        
${ACCESSKEY}       
${REMOTE_URL}      https://${USERNAME}:${ACCESSKEY}@mobile-hub.lambdatest.com/wd/hub
${LOCAL_URL}       http://127.0.0.1:{}/wd/hub

#######  MOBILE WEB INFO ##########################################
${url}             https://lambdatest.github.io/sample-todo-app/

&{desired_cap}     platformName=iOS
  ...    platformVersion=13
  ...    deviceName=iPhone 11
  ...    nativeWebScreenshot=${True}
  ...    build=Demo
  ...    isRealMobile=${True}
  ...    console=${True} 
  ...    visual=${True}
  ...    network=${True}
  ...    tunnel=${False}
  ...    newCommandTimeout=300

