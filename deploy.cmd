@echo off
set SFDC_ORG_URL="https://login.salesforce.com"
set SFDC_ORG_USER="harsh.rawat@absyz.com.deplyment"
set PROD_CONSUMER_KEY="3MVG9fe4g9fhX0E6kcopvWInnuBJxpZc1Niht_.nYiM3dPSbqk7lq3JC2i0iecHSLHHjiBYkh"

set PROJECT_FOLDER="project"
set DEPLOY_LOCATION="./force-app/main/default"

echo %SFDC_PROD_URL%
echo %SFDC_PROD_USER%

call sfdx auth:jwt:grant -u %SFDC_PROD_USER% -f ./key/server.key -i %PROD_CONSUMER_KEY% -r %SFDC_PROD_URL%
cd %PROJECT_FOLDER%

if %1==1 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %SFDC_PROD_USER% -l NoTestRun
if %1==2 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %SFDC_PROD_USER% -l RunLocalTests
if %1==3 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %SFDC_PROD_USER% -l RunSpecifiedTests -r %2
cd..