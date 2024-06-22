*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://www.deviantart.com/users/login
${USERNAME}    deadfromtheborn
${PASSWORD}    2020lifestar$
${HOMEPAGE_URL}    https://www.deviantart.com

*** Test Cases ***
User Login with Email
    [Documentation]    Test the user login process on DeviantArt
    Open Browser    ${LOGIN_URL}    browser=firefox
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@id='username']    20s
    Input Text    xpath=//input[@id='username']    ${USERNAME}
    Click Element    xpath=//button[contains(., "Next")]
    Wait Until Element Is Visible    xpath=//input[@id='password']    20s
    Input Text    xpath=//input[@id='password']    ${PASSWORD}
    Click Element    xpath=//button[contains(., "Log In")]
    Wait Until Location Contains    ${HOMEPAGE_URL}    20s
    Location Should Be ${HOMEPAGE_URL}


