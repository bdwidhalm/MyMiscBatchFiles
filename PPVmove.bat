ECHO OFF
SET shared="\\SLSFileShare\Shared\Servicing Operations\CFPB Contingency - PPV Import"
SET ppv=\\cifprdrep\PV_Data6\InLineData\CRWDOCGEN\
SET /A month=%Date:~4,2%
SET monthText=%Date:~4,2%
SET year=%Date:~10,4%
SET day=%Date:~7,2%
IF NOT EXIST %ppv%%year%%month% MKDIR %ppv%%year%%month%
SET logFile="C:\PPVmove\"%year%"-"%monthText%"-"%day%"_PPVmoveLog.txt"
IF EXIST %shared%\*.pdf (
PUSHD %shared%
COPY /b *.* +,,
POPD
ECHO =================================================================== >> %logFile%
ECHO %date% %time% >> %logFile%
ECHO ------------------------------------------------------------------- >> %logFile%
MOVE %shared%\*.* %ppv%%year%%month% >> %logFile%
)