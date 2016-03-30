#!/bin/bash 

# Configuration
# -------------
# APP_REPO: The git clone URL which contains
# APP_PATH: (optional) The path of the application to start

if [[ -z "${APP_REPO}" ]]; then
    echo "The APP_REPO was not specified. Exiting in 60 seconds..."
    sleep 60
fi

# clean-up the app folder first
rm -rf /app/*

# do the git clone
git clone "${APP_REPO}" "/app"
cd /app

# restore the packages and generate project.lock.json files
dotnet restore

# go to the application path, if one is specified
if [[ $APP_PATH ]]; then
	cd $APP_PATH
fi

# start the application
dotnet run