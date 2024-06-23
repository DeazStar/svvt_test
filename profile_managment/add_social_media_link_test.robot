*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/login.robot

*** Variables ***
${SECTION_CLASS}    module-6080623561
${SOCIAL_LINK}   www.facebook.com/testUserName
*** Test Cases ***
Edit Bio Test
    User Login with Email  # Execute the keyword from login_test.robot
    Go To Profile Page
    Click Edit Button
    Click Social Tab
    Edit Bio
    Save Changes
    Verify
    [Teardown] Close Browser

*** Keywords ***
Go To Profile Page
    Go To    https://www.deviantart.com/deadfromtheborn

Click Edit Button
    Wait Until Element Is Visible    xpath=//button[.//span[contains(text(), "Edit")]][1]  20s
    Click Button   //section[contains(@id, '${SECTION_CLASS}')]//div//div//div//button[.//span[contains(text(), "Edit")]]


Click Social Tab
    Wait Until Element Is Visible   xpath=//button[.//span[contains(text(), "Social Media")]]  20s
    Click Button    xpath=//button[.//span[contains(text(), "Social Media")]]

Edit Bio
    Wait Until Element Is Visible    xpath=//input[contains(@class, 'aFKMF _3kAA3')]    20s
    Input Text    xpath=//input[contains(@class, 'aFKMF _3kAA3')]    ${SOCIAL_LINK}

Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[text()='Save']]    20s
    Click Button    xpath=//button[.//span[text()='Save']]

