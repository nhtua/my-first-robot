*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
...               For database interaction, read document here http://franz-see.github.io/Robotframework-Database-Library/
Library           SeleniumLibrary
Library           OperatingSystem
Library           DatabaseLibrary

*** Variables ***
${SERVER}             localhost:8000
${BROWSER}            Firefox
${DELAY}              0.5
${HOME PAGE}          http://${SERVER}/
${LIST PAGE}          http://${SERVER}/todolist
${TODOLIST ROOT DIR}  /home/tua/Dev/Github/tua-todolist

*** Keywords ***
Open Home Page
    Open Browser    ${HOME PAGE}       ${BROWSER}

Open Specific Todolist
    [Arguments]     ${list id}
    Open Browser    ${LIST PAGE}/${list id}/

Input Todolist Item
    [Arguments]     ${item}
    Input Text      id:id_description     ${item}     True

Submit Todolist Item
    Click Button    css:input[type="submit"]

Connect Todolist Database
    Connect To Database 	psycopg2    todolist    postgres    s3cr3t  localhost   5432

Insert fixture data
    Connect Todolist Database
    Execute Sql Script 	    ${EXECDIR}/fixtures/init-first-todolist.sql
    Disconnect from Database

Clear test data
    Run             cd ${TODOLIST ROOT DIR} && pipenv run python manage.py flush --noinput
