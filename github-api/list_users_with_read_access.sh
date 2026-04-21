#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # 
#
# About: This Script is for list the members who has read access
#
# Owner: Rohan Irkullawar
#
# Date: 04/2026
#
# # # # # # # # # # # # # # # # # # # # # #


# GitHub API URL
API_URL="https://api.github.com"

# Usename and tokens
USERNAME=$username
TOKEN=$token

#repo_owner and repo_name
REPO_OWNER=$1
REPO_NAME=$2

# To get the github api

function get_github_api {
                         local endpoint="$1"
                         local URL="${API_URL}/${endpoint}"
                         curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

#To fetch the list of users with read accesss

function list_users_with_read_access {
                                      local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborations"
                                      collaboration="$(get_github_api "$endpoint" | jq -r '.[] | select[(.permissions.pull==true | .login')"

if [[ -z "$collaboration" ]]; then
             echo "There are no users with read access for ${REPO_OWNER}/${REPO_NAME}"
else
    echo "The user with read access for ${REPO_OWNER}/${REPO_NAME} are"
    echo "$collaborations" 
fi
}