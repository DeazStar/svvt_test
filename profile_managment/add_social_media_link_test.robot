*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/login.robot

*** Variables ***
${SOCIAL_LINK}    https://www.linkedin.com/in/naod-ararsa-109491212/

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
    Wait Until Element Is Visible     (xpath=//button[.//span[contains(text(), "Edit")]])[2]  20s
    Click Button    (xpath=//button[.//span[contains(text(), "Edit")]])[2]


Click Social Tab
    Wait Until Element Is Visible   xpath=//button[.//span[contains(text(), "Social Media")]]
   20s
    Click Button    xpath=//button[.//span[contains(text(), "Social Media")]]

Edit Bio
    Wait Until Element Is Visible    (xpath=//div[contains(@class, 'aFKMF')])[5]    20s
    Input Text    (xpath=//input[contains(@class, 'aFKMF')])[5]    ${SOCIAL_LINK}

Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[text()='Save']]    20s
    Click Button    xpath=//button[.//span[text()='Save']]

Verify
  Wait Until Element Is Visible xpath=//p[.//span[contains(text(), ${SOCIAL_LINK})]]
