*** Settings ***
Library           SeleniumLibrary    10


*** Variables ***
${browser}     Chrome
${perfecto_hub_url}     https://trial.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}       eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2NjUxMzEzMTMsImp0aSI6ImEyNmViNTBiLTYxNTYtNGZhMi04YzQ2LWZiMDE5NGI5Y2UyYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6IjQxMDI5ODk2LTZjYmEtNGM0NS1iMGVlLWEwNWFmODBkZDlhYSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiZGQ4NjM3OGItZjU0OS00NDJiLTg1OWUtZjJjOWE3OGM1MzhlIiwic2Vzc2lvbl9zdGF0ZSI6IjA1YjUzODQ1LTQwNjQtNGFmZS1iMzFlLTkyM2FlMDk3MmZkMSIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.MMSRH6A-ixzvl1Oo9x3Fwplo2oQXVmZ_DOZmcUQEYx8


*** keywords ***
open test bb
    [Arguments]  ${b}==Chrome
    ${capbilities}=     Create Dictionary       platformName=Windows      platformVersion=10      location=US East     resolution=1280x1024     browserName=Chrome       browserVersion=83      securityToken=${perfecto_token}
    run keyword if      '${b}'=='Chrome'        open browser    https://perfecto.io    chrome    perfecto-run    ${perfecto_hub_url}       ${capbilities}

Open Getting Started page
    Click element     xpath=//*[@id="perfecto-hp-banner"]/div/div/div/div/div[3]/div/div/div/span/a
    Select Window     NEW

Fill the firstname and lastname fields
    input text     xpath=//input[@id="FirstName"]    firstname
    Textfield Value Should Be      xpath=//input[@id="FirstName"]    firstname
    input text     xpath=//input[@id="LastName"]    lastname
    Textfield Value Should Be      xpath=//input[@id="LastName"]    lastname
