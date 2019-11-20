*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:8000
${BROWSER}        Firefox
${DELAY}          0
${HOME PAGE}      http://${SERVER}/
${LIST PAGE}      http://${SERVER}/todolist/

*** Keywords ***
Open Home Page
    Open Browser        ${HOME PAGE}       ${BROWSER}

Open Specific Todolist
    [Arguments]     ${list id}
    Open Browser    ${LIST PAGE}/${list id}/

Input Todolist Item
    [Arguments]     ${item}
    Input Text      id:id_description     ${item}     True

Submit Todolist Item
    Click Button    css:input[type="submit"]