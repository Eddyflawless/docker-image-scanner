#! /bin/bash

if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]; then
    echo "Usage: ./init.sh [OPTIONS] COMMAND [arg...]"
    echo "       ./init.sh [ -h | --help ]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Prints usage."
    echo ""
    echo "Commands:"
    echo "./init.sh directory-to-npm-projects"
    exit
fi


dir=$(pwd)"/util.sh"
source "$dir"

loadEnv

work_dir=$1
snyk_token=$SYNK_TOKEN

npm install -g snyk 
cd "$work_dir" || exit
npm install
synck auth "$snyk_token"
# use [snyk monitor] when You want Snapshot and continuously monitor your project on the 
# snyk dashboard
snyk test -d --show-vulnerable-paths=true --all-projects
