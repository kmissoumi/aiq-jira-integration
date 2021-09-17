# Sauce Jira

[Generate Your API Token](https://id.atlassian.com/manage-profile/security/api-tokens)

```
JIRA_TOKEN=

```


* [To generate the Authorization: Basic TOKEN header](https://community.atlassian.com/t5/Jira-questions/How-to-authenticate-to-Jira-REST-API-with-curl/qaq-p/1312165)


```
echo -n ${EMAIL}:${JIRA_TOKEN} | base64

```


[Sauce JIRA Test Project](
https://saucedev.atlassian.net/secure/RapidBoard.jspa?rapidView=415&projectKey=TEST)




# Jira REST API


[JIRA REST API Examples](https://developer.atlassian.com/server/jira/platform/jira-rest-api-examples/)


[Developer Jira Basic auth for REST APIs](https://developer.atlassian.com/cloud/jira/platform/basic-auth-for-rest-apis/)


```

JIRA_INSTANCE="saucedev.atlassian.net"
JIRA_TOKEN=""
EMAIL="kareem.missoumi@saucelabs.com"
# JIRA_BASIC_AUTH=$(echo ${EMAIL}:${JIRA_TOKEN} | base64)



# create our data
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


echo curl --request POST \
  --url "https://${JIRA_INSTANCE}/rest/api/3/issue" \
  --user "${EMAIL}:${JIRA_TOKEN}" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
      "fields": {
         "project":
         {
            "key": "TEST"
         },
         "summary": "AIQ Jira Integration Demo",
         "description": "Creating of an issue using project keys and issue type names using the REST API",
         "issuetype": {
            "name": "Bug"
         }
     }
  }'


# building the request
[Creating a Jira Cloud Issue in a Single REST Call](https://blog.developer.atlassian.com/creating-a-jira-cloud-issue-in-a-single-rest-call/)




# get the issue types
curl --request GET \
  --url "https://${JIRA_INSTANCE}/rest/api/3/issuetype" \
  --user "${EMAIL}:${JIRA_TOKEN}" \
  --header 'Accept: application/json' \
  | jq


# get the project keys
curl --request GET \
  --url 'https://${JIRA_INSTANCE}/rest/api/3/project/search' \
  --user "${EMAIL}:${JIRA_TOKEN}" \
  --header 'Accept: application/json' \


# get the required fields and metadata to create an issue

```
curl \
   -D- \
   -u charlie:charlie \
   -X POST \
   --data ${jsonData} \
   -H "Content-Type: application/json" \
   http://${SAUCE_JIRA_INSTANCE}/rest/api/2/issue/
```



```# JSON input data
{
    "fields": {
       "project":
       {
          "key": "TEST"
       },
       "summary": "REST ye merry gentlemen.",
       "description": "Creating of an issue using project keys and issue type names using the REST API",
       "issuetype": {
          "name": "Bug"
       }
   }
}

```
