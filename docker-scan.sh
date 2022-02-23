#! /bin/bash

if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]; then
    echo "Usage: ./docker-scan.sh [OPTIONS] COMMAND [arg...]"
    echo "       ./docker-scan.sh [ -h | --help ]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Prints usage."
    echo ""
    echo "Commands:"
    echo "./docker-scan.sh directory-to-dockerfile"
    exit
fi

dir=$(pwd)"/util.sh"
source "$dir"

loadEnv

path_to_dockerfile=$1
dimage=$2 #docker image name with tag
snyk_token=$2
docker scan --login
cd "$path_to_dockerfile" || exit
docker scan "$dimage"  --token "$snyk_token" --dependency-tree \
 --exclude-base --json 