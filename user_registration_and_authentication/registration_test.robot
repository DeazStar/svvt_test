*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL}    ararsa0@gmail.com
${PASSWORD}    SecurePassword123
${USERNAME}    testuser
${DOB_MONTH}    January
${DOB_DAY}    1
${DOB_YEAR}    1990
${URL}    https://www.deviantart.com/join

*** Test Cases ***
User Registration Test
    [Documentation]    Test the user registration process on DeviantArt
    Open Browser    ${URL}    browser=firefox
    Wait Until Element Is Visible    id=email    20s
    Input Text    id=email    ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    xpath=//button[.//span[contains(text(), "Continue with Email")]]    20s
    Click Element    xpath=//button[.//span[contains(text(), "Continue with Email")]]
    Wait Until Element Is Visible    id=username    20s
    Input Text    id=username    ${USERNAME}

    Execute JavaScript    document.querySelectorAll('select')[0].value = '1'  # January
    Execute JavaScript    document.querySelectorAll('select')[1].value = '1'  # 1
    Execute JavaScript    document.querySelectorAll('select')[2].value = '1990'  # 1990

    Wait Until Element Is Visible    xpath=//button[contains(., "Join")]    20s
    Click Element    xpath=//button[contains(., "Join")]
    Wait Until Page Contains    onboarding    20s
    [Teardown]    Close Browser

*** Keywords ***
Select From List By Label
    [Arguments]    ${locator}    ${label}
    Select From List    ${locator}    ${label}

