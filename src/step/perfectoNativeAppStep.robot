*** Settings ***
Library           AppiumLibrary    10

*** Variables ***
${perfecturl}        https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub
${token}             eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2NjUxMzEzMTMsImp0aSI6ImEyNmViNTBiLTYxNTYtNGZhMi04YzQ2LWZiMDE5NGI5Y2UyYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6IjQxMDI5ODk2LTZjYmEtNGM0NS1iMGVlLWEwNWFmODBkZDlhYSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiZGQ4NjM3OGItZjU0OS00NDJiLTg1OWUtZjJjOWE3OGM1MzhlIiwic2Vzc2lvbl9zdGF0ZSI6IjA1YjUzODQ1LTQwNjQtNGFmZS1iMzFlLTkyM2FlMDk3MmZkMSIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.MMSRH6A-ixzvl1Oo9x3Fwplo2oQXVmZ_DOZmcUQEYx8
${bundleId}          com.apple.mobilenotes
${deviceid_iphone}   00008030-001824812E28802E


*** keywords ***
open test device and launch mobilenotes
    [arguments]     ${devicemodel}
    run keyword if  '${devicemodel}'=='iPhone'     open application    ${perfecturl}   securityToken=${token}    deviceName=${deviceid_iphone}      noReset=${True}   bundleId=${bundleId}
    run keyword if  '${devicemodel}'=='Android'    open application    ${perfecturl}   securityToken=${token}    deviceName=${deviceid_android}     noReset=${True}   browserName=mobileOS


create a note
    click element  //*[@label="New note"]
    input text     //*[@label="Note"]     test1234
    click element  //*[@label="Done"]

goto home screen
    ${time}=     convert to integer  -1
    background app    ${time}
