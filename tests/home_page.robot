*** Settings ***
Documentation    Test home page Todolist
Resource         resource.robot

*** Test Cases ***
Create New Todolist From Home Page
    Open Browser To Home Page
    Input Todolist Item     eggs
    Submit Todolist Item
    Page Should Contain     eggs
    [Teardown]  Close Browser

*** Keywords ***
Provided precondition
    Setup system under test