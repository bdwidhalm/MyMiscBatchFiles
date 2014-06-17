@ECHO OFF
ECHO IP=%1
FOR /F "tokens=2,3 delims= " %%A IN ('PING -a %1') DO IF "%%B"=="[%1]" SET PC=%%A
SET PC
FOR /F "tokens=1 delims= " %%A IN ('NBTSTAT -a %PC% ˆ| FIND "<03>" ˆ| FIND /I /V "%PC%"') DO SET USER=%%A
SET USER