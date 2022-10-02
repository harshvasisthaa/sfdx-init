@echo off
set SFDC_PROD_URL="https://test.salesforce.com"
set SFDC_SANDBOX_URL="https://login.salesforce.com"

set SFDC_PROD_USER="harshvijaykumarrawat@gmail.com"
set SFDC_SANDBOX_USER="harshvijaykumarrawat@gmail.com"

set SANDBOX_CONSUMER_KEY="testconkey"
set PROD_CONSUMER_KEY="testconkey"

set GIT_REPO_LOCATION="test/location/"

echo %SFDC_PROD_URL%
echo %SFDC_PROD_USER%


sfdx force:auth:jwt:grant --clientid %CONSUMER_KEY% --username %SFDC_PROD_USER% --jwtkeyfile keys/server.key --setdefaultdevhubusername --setalias sfdx-ci --instanceurl %SFDC_PROD_URL%
sfdx force:source:convert -d mdapi
sfdx force:deploy -p %SOURCE_PATH% -u %SFDC_PROD_USER%