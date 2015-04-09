#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
#                                                                     #
# Ensure you have the Heroku Toolbelt and Composer already installed. #
#                                                                     #
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

# Check for required argument.
if [ $# -eq 0 ]
    then
        echo 'Please provide the name of the app (e.g. bash bootstrap.sh leeeeeroy-jenkins)'
        exit 1
fi

# Check for Composer and the Heroku Toolbelt
type composer >/dev/null 2>&1 || {
    echo >&2 "Composer is required: https://getcomposer.org/"
    exit 1
}
type heroku >/dev/null 2>&1 || {
    echo >&2 "The Heroku Toolbelt is required: https://toolbelt.heroku.com"
    exit 1
}

# Install the Composer packages.
composer install --ignore-platform-reqs --prefer-source --no-interaction

# Create a new git repo in the project folder.
git init
touch .gitignore
echo "vendor" >> .gitignore
git add .
git commit -m "Initial Commit"

# Create the app on Heroku.
# You will be asked for your Heroku credentials if this is the first time using the CLI tool.
heroku create $1

# Add the proper buildpack so that Heroku recognizes this is a PHP app.
heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-php

# Push the repo to Heroku.
git push heroku master
