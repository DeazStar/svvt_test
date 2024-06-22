*** Settings ***
Resource   ../resources/login.robot
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${PROFILE_PAGE_URL}    https://www.deviantart.com/deadfromtheborn
${AUTH_TOKEN}          __c5343da1765dad39ee0e%3B%2214356742c476d20de970bf35eb795a63%22
${IMAGE_PATH}          linkedin.jpg 

*** Test Cases ***
Upload Profile Image
    [Documentation]    Test uploading a profile image on DeviantArt
    User Login with Email
    Go To  ${PROFILE_PAGE_URL}
    Click Profile Icon
    Upload Image    ${IMAGE_PATH}
    [Teardown]    Close Browser

*** Keywords ***

Click Profile Icon
    Click Element    xpath=//button[contains(@class, 'hCUBO')]
    BuiltIn.Sleep    3s   # Adjust the wait time as needed for the profile icon to load

Upload Image
    [Arguments]    ${image_path}
    Click Element    xpath=//button[contains(@class, 'reset-button')]
    Choose File    xpath=//input[@type='file']    ${image_path}
    Sleep    3s   # Adjust the wait time as needed based on the upload speed
    Click Element    xpath=//button[.//span[contains(text(), "Confirm")]]


