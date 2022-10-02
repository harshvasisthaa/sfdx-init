@echo off
set PROJECT_FOLDER="project"
set DEPLOY_LOCATION="./force-app/main/default"

call sfdx auth:jwt:grant -u %3 -f ./key/server.key -i %1 -r %2
cd %PROJECT_FOLDER%

if %4==1 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %3 -l NoTestRun
if %4==2 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %3 -l RunLocalTests
if %4==3 call sfdx force:source:deploy -p %DEPLOY_LOCATION% -u %3 -l RunSpecifiedTests -r %5
cd..