#!/usr/bin/env bash
now=`date +%Y%m%d_%H%M%S`
pipenv run robot --outputdir "results/${now}" tests