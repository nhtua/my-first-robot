A demo for Robot Framework
==========================

This project uses Robot Framework to test the app [Django Todolist](https://github.com/nhtua/django-todolist)

Please follow its README to install and start the Todolist app first.

## prerequisite

You need to be able to

- Setup python virtual environment using Pyenv, Pipenv
- Install and start Todolist app on http://localhost:8000/


## Install 

Install Robot Framework and related packages

    sudo apt install firefox-geckodriver chromium-chromedriver
    pipenv install
    
    
You may want to change database connection. Open and edit your settings on top of file `tests/resource.robot`


## Run test suites

To start test suites, type command
    
    ./start.sh