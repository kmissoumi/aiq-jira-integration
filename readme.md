


# Jira Integration for AutonomIq




### Generate Your API Token

[Generate Your API Token](https://id.atlassian.com/manage-profile/security/api-tokens)


Account Settings > Security > API Token

Update defaults in the `jira_issue_open.sh` script.
```
JIRA_TOKEN=""
EMAIL="kareem.missoumi@saucelabs.com"
```

Execute locally to validate your credentials work.



### Upload Script to AIQ

Project Details > Data Tab > ... Upload > Artifacts Tab > Upload >
Next > Associate w/ Test Case

### Enter Steps
Enter Step A
`Exec "jira_issue_open.sh" returning ${issueKey}`

Enter Optional Step B1
`open website https://saucedev.atlassian.net/browse/${issueKey}`

Enter Optional Step B2
`if variable ${response} is empty, run ${error_flow}`

The value for issueKey is available on the project details variables tab.
