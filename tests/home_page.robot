*** Settings ***
Documentation   Test home page Todolist
Resource        resource.robot
Test Setup      Run Keywords
...             Clear test data     AND
...             Set Selenium Speed  ${DELAY}
Test Teardown   Clear test data
Suite Teardown  Close Browser

*** Test Cases ***
Create New Todolist From Home Page
    Open Home Page
    Input Todolist Item     eggs
    Submit Todolist Item
    Page Should Contain     eggs
    [Teardown]  Close Browser
