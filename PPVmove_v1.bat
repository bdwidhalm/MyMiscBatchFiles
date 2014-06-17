ECHO OFF
SET shared="\\SLSFileShare\Shared\Servicing Operations\CFPB Contingency - PPV Import"
SET ppv=\\cifprdrep\PV_Data6\InLineData\CRWDOCGEN\
SET month=%Date:~4,2%
SET year=%Date:~10,4%
IF NOT EXIST %ppv%%year%%month% MKDIR %ppv%%year%%month%
PUSHD %shared%
COPY /b *.* +,,
POPD
MOVE %shared%\*.* %ppv%%year%%month%
