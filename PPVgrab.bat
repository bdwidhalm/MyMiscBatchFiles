@ECHO OFF
SET inFolder=C:\WoodysScripts\PPVdrop\
SET fileList=C:\WoodysScripts\fileList.txt
SET logFile=C:\WoodysScripts\PPVgrab_log.txt

FOR /F "delims=" %%L in (%fileList%) DO (
	FOR /F "tokens=1,2,3 delims=|" %%A in ("%%L") do (
      COPY /Y %%B %inFolder%%%C >> %logFile%
   )
)

PAUSE