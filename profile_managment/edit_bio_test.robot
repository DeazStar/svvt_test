*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/login.robot

*** Variables ***
${BIO_TEXT}    This is my updated bio.
${SECTION_CLASS}    module-6080623561

*** Test Cases ***
Edit Bio Test
    User Login with Email  # Execute the keyword from login_test.robot
    Go To Profile Page
    Click Edit Button
    Click Bio Tab
    Edit Bio
    Save Changes
    Close Browser

*** Keywords ***
Go To Profile Page
    Go To    https://www.deviantart.com/deadfromtheborn

Click Edit Button
    Wait Until Element Is Visible    xpath=//button[.//span[contains(text(), "Edit")]][1]  20s
    Click Button   //section[contains(@id, '${SECTION_CLASS}')]//div//div//div//button[.//span[contains(text(), "Edit")]]

Click Bio Tab
    Wait Until Element Is Visible   xpath=//button[.//span[contains(text(), "Bio")]]  20s
    Click Button    xpath=//button[.//span[contains(text(), "Bio")]]

Edit Bio
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'public-DraftEditor-content')]    20s
    Execute JavaScript    document.querySelector('.public-DraftEditor-content[contenteditable="true"]').innerText = '${BIO_TEXT}'

Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[text()='Save']]    20s
    Click Button    xpath=//button[.//span[text()='Save']]

Verify
  Wait Until Element Is Visible xpath=//p[.//span[contains(text(), ${BIO_TEXT})]]
