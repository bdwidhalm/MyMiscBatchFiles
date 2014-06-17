@ECHO OFF

SET location="\\webprd05\Continuity\RejectedFiles\NCP_Documents\BusRulesErr"
SET smtpName="excprd01.specializedservicing.com"
SET toName="Brian.Widhalm@SLS.net"
SET fromName="fileWatch@SLS.net"
SET subjectLine="TEST File Watch Email TEST"
SET bodyText="This is only a TEST...Don't be alarmed"

FOR /F "delims=" %%d in (fileWatch.config) DO (
	ECHO %%d
	for /f %%A in ("%%d") DO (
		SET file2=%%A
		SET exten=%%B
		ECHO FILE: %file2%
		ECHO EXT:  %exten%
	)
)


bmail -s %smtpName% -t %toName% -f %fromName% -h -a %subjectLine% -b %bodyText%

ECHO %location%
DIR %location%
DIR /a-d %location%\*
IF EXIST %location%\*.zip (ECHO zip exists)
IF EXIST %location%\*.pdf (ECHO pdf exists)
IF EXIST %location%\*.* (ECHO file exists)

echo Using dir
for /f %%A in ('dir %location%\^| find "File(s)"') do set cnt=%%A
echo File count = %cnt%

echo Simple
set cnt=0
for %%A in (%location%\*) do set /a cnt+=1
echo File count = %cnt%



PAUSE