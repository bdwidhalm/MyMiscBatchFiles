@ECHO OFF
SET varFile=C:\TESTContinuity\Logs\ContVarFile.txt

FOR /F "delims=" %%a in (%varFile%) DO (
	ECHO %%a
)

PAUSE