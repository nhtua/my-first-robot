*** Settings ***
Documentation   Test todolist function
Resource        resource.robot
Test Setup      Run Keywords
...             Clear test data         AND
...             Insert fixture data     AND
...             Set Selenium Speed      ${DELAY}
Test Teardown   Clear test data
Suite Teardown  Close Browser

*** Test Cases ***
Open todolist to add items
    Open Specific Todolist      1
    Add item to a list          milk
    Add item to a list          beef
    Add item to a list          cucumber
    Page Should Contain         milk
    Page Should Contain         beef
    Page Should Contain         cucumber
    [Teardown]  Close Browser

*** Keywords ***
Add item to a list
    [Arguments]                 ${item}
    Input Todolist Item         ${item}
    Submit Todolist Item
