*** Settings ***
Documentation    Test todolist function
Resource         resource.robot
Suite Setup      Set Selenium Speed  ${DELAY}
Suite Teardown   Close Browser

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
