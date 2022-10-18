*** Settings ***
Library           SeleniumLibrary    10
# Library           PerfectoLibrary    RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${browser}     Chrome
${perfecto_hub_url}     https://trial.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}       eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2NjUxMzEzMTMsImp0aSI6ImEyNmViNTBiLTYxNTYtNGZhMi04YzQ2LWZiMDE5NGI5Y2UyYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6IjQxMDI5ODk2LTZjYmEtNGM0NS1iMGVlLWEwNWFmODBkZDlhYSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiZGQ4NjM3OGItZjU0OS00NDJiLTg1OWUtZjJjOWE3OGM1MzhlIiwic2Vzc2lvbl9zdGF0ZSI6IjA1YjUzODQ1LTQwNjQtNGFmZS1iMzFlLTkyM2FlMDk3MmZkMSIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.MMSRH6A-ixzvl1Oo9x3Fwplo2oQXVmZ_DOZmcUQEYx8

*** Test Cases ***
Open Perfecto site
    [Tags]    Perfeco  Browser   Chrome    v106
    [teardown]      Close all browsers
    open test bb      ${browser}
#    Open Getting Started page
    Fill the Email/Password fields and click on login

*** keywords ***
open test bb
    [Arguments]  ${b}
    ${capbilities}=     Create Dictionary     platformName=Windows      platformVersion=10      location=US East     resolution=1280x1024     browserName=Chrome       browserVersion=106      securityToken=${perfecto_token}
    run keyword if      '${b}'=='Chrome'      open browser    http://expensetracker.perfectomobile.com/    chrome    perfecto-run    ${perfecto_hub_url}       ${capbilities}

#Open Getting Started page
#    Click element     xpath=//*[@id="perfecto-hp-banner"]/div/div/div/div/div[3]/div/div/div/span/a
#    Select Window     NEW

Fill the Email/Password fields and click on login
    input text     xpath=//input[@name='login_email']    test@perfecto.com
#    Textfield Value Should Be      xpath=//input[@id="FirstName"]    firstname
    input text     xpath=//input[@name='login_password']    test123
#    Textfield Value Should Be      xpath=//input[@id="LastName"]    lastname
    Click element     xpath=//ion-button[@id='login_login_btn']

