@ECHO OFF
REM SET location1="\\webprd05\Continuity\RejectedFiles\NCP_Documents\BusRulesErr"
REM SET location2="\\webprd05\Continuity\RejectedFiles\ComputerShare\BusRulesErr"

SET location1="C:\TESTCOPY\NCP_Documents\BusRulesErr"
SET location2="C:\TESTCOPY\ComputerShare\BusRulesErr"

SET smtpName="excprd01.specializedservicing.com"
SET toName="Brian.Widhalm@SLS.net"
SET fromName="fileWatch@SLS.net"
SET subjectLine="***LOCAL TEST***Continuity File Watch - Rejected Files ***LOCAL TEST***"
SET count=0
SET count1=0
SET count2=0
SET day=%Date:~7,2%
SET month=%Date:~4,2%
SET year=%Date:~10,4%
SET logFile="C:\fileWatch\"%year%"-"%month%"-"%day%"_fileWatchLog.txt"
ECHO =================================================================== >> %logFile%
ECHO %date% %time% >> %logFile%

IF EXIST %location1%\*.* (
ECHO file exists
	FOR %%A in (%location1%\*) DO (
		SET /A count+=1
		SET /A count1+=1
	) 
)

IF EXIST %location2%\*.* (
ECHO file exists
	FOR %%A in (%location2%\*) DO (
		SET /A count+=1
		SET /A count2+=1
	) 
)

SET bodyText="   There are %count1% files in the %location1% location AND %count2% files in the %location2% location."

IF %count% GTR 0 (
bmail -s %smtpName% -t %toName% -f %fromName% -h -a %subjectLine% -b %bodyText%
)
