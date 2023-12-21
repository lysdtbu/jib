@echo on

REM Java 9 does not work with Mockito mockmaker.
echo %JAVA_HOME%

cd github/jib

REM Stops any left-over containers.
REM FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker rm -vf %%i

call gradlew.bat -p jib-gradle-plugin build --info --stacktrace  --tests JibExtensionTest.testProperties

exit /b %ERRORLEVEL%
