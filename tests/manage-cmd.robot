*** Settings ***
Documentation       Test Todolist command line
Resource            resource.robot
Test Setup          Clear test data
Test Teardown       Clear test data
Library             DatabaseLibrary
Library             OperatingSystem  # view syntax here http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html

*** Test Cases ***
Test command flush database
    # prepare fixture
    Insert fixture data

    # run the testee
    Run     cd ${TODOLIST ROOT DIR} && pipenv run python manage.py flush --noinput

    # check the database
    Connect Todolist Database
    Row Count Is Equal To X     SELECT * FROM lists_todolist    0
    Row Count Is Equal To X     SELECT * FROM lists_todo        0
    disconnect from database

Test command show migrations
    ${output} =         Run     cd ${TODOLIST ROOT DIR} && pipenv run python manage.py showmigrations

    Should Contain      ${output}   accounts
    Should Contain      ${output}   api
    Should Contain      ${output}   auth
    Should Contain      ${output}   contenttypes
    Should Contain      ${output}   lists
    Should Contain      ${output}   sessions
