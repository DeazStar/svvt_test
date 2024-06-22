*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://www.deviantart.com/users/login
${USERNAME}    deadfromtheborn
${RESET_CONFIRMATION_TEXT}    There should be a link to recover your account

*** Test Cases ***
Password Recovery
    [Documentation]    Test the password recovery process on DeviantArt
    Open Browser    ${LOGIN_URL}    browser=firefox
    Maximize Browser Window
    Click "Forgot username or password"
    Enter Username for Password Recovery
    Click Send Email
    Check for Password Reset Confirmation
    [Teardown]    Close Browser

*** Keywords ***
Click "Forgot username or password"
    Wait Until Element Is Visible    xpath=//a[contains(., "Forgot username or password?")]    20s
    Click Element    xpath=//a[contains(., "Forgot username or password?")]

Enter Username for Password Recovery
    Wait Until Element Is Visible    xpath=//input[@id='username']    20s
    Input Text    xpath=//input[@id='username']    ${USERNAME}

Click Send Email
    Click Element    xpath=//button[contains(., "Send Email")]

Check for Password Reset Confirmation
    Wait Until Element Is Visible    xpath=//*[contains(text(), "${RESET_CONFIRMATION_TEXT}")]    20s
    Element Should Contain    xpath=//*[contains(text(), "${RESET_CONFIRMATION_TEXT}")]    ${RESET_CONFIRMATION_TEXT}

