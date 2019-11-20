*** Settings ***
Documentation    Test home page Todolist
Resource         resource.robot
Suite Setup      Set Selenium Speed  ${DELAY}
Suite Teardown   Close Browser

*** Test Cases ***
Create New Todolist From Home Page
    Open Home Page
    Input Todolist Item     eggs
    Submit Todolist Item
    Page Should Contain     eggs
    [Teardown]  Close Browser
