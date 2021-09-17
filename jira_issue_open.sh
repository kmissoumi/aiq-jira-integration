#!/bin/bash


# first input argument
data = aiq_1

JIRA_INSTANCE="saucedev.atlassian.net"
JIRA_TOKEN=""
EMAIL="kareem.missoumi@saucelabs.com"
response=""

jsonData()
{
  cat <<EOF
{
  "fields": {
          "summary": "AIQ Jira Integration Test",
          "issuetype": {
              "id": "10802"
          },
          "project": {
              "key": "TEST"
          },
          "description": {
              "type": "doc",
              "version": 1,
              "content": [
                  {
                  "type": "paragraph",
                  "content": [
                      {
                      "text": "This is the description.",
                      "type": "text"
                      }
                  ]
                  }
              ]
          }
  }
}
EOF
}


# send request
response=$(curl --request POST \
  --url "https://${JIRA_INSTANCE}/rest/api/3/issue" \
  --user "${EMAIL}:${JIRA_TOKEN}" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data "$(jsonData)")

# get the issueId
issueId=$(echo ${response}| jq -r .id)
issueKey=$(echo ${response}| jq -r .key)

# return the issueId
echo ${issueKey}
