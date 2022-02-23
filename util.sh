#! /bin/bash

env_file=$(pwd)"/.env"

#load .env file
loadEnv(){
    if [ -f .env ]
    then
        export $(cat "$env_file" | sed 's/#.*//g' | xargs)
    else
        echo "No $env_file file found" 1>&2
        return 1
    fi
}
