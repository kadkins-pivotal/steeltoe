@ECHO OFF
:: Output dotnet info
dotnet --info

SET number=00000%APPVEYOR_BUILD_NUMBER%
SET STEELTOE_VERSION_SUFFIX=%APPVEYOR_REPO_BRANCH%-%number:~-5%
echo %STEELTOE_VERSION_SUFFIX%
IF %APPVEYOR_REPO_BRANCH%=="master" (copy config\nuget-master.config .\nuget.config)
IF %APPVEYOR_REPO_BRANCH%=="dev" (copy config\nuget-dev.config .\nuget.config)
IF NOT %APPVEYOR_REPO_TAG_NAME%=="" (copy config\nuget.config .\nuget.config)