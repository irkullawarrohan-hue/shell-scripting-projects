#!/bin/bash

# -------------------------------
# Author: Rohan Irkullawar
# Purpose: List users with READ access
# -------------------------------

helper()

API_URL="https://api.github.com"

USERNAME=$username
TOKEN=$token

REPO_OWNER=$1
REPO_NAME=$2

list_users_with_read() {

    # Step 1: Create endpoint
    endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Step 2: Create full URL
    url="${API_URL}/${endpoint}"

    # Step 3: Call API and filter users
    users=$(curl -s -u "${USERNAME}:${TOKEN}" "$url" \
        | jq -r '.[] | select(.permissions.pull==true) | .login')

    # Step 4: Print result
    if [ -z "$users" ]; then
        echo "No users with read access in ${REPO_OWNER}/${REPO_NAME}"
    else
        echo "Users with read access:"
        echo "$users"
    fi
}

helper() {
  expected_cmd_args=2
  if [ $# -ne $expected_cmd_args ]; then
  echo "Pass the required arguments/parameters"
  fi
  }
