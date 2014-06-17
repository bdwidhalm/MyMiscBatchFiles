@ECHO OFF
SET folderBOA="C:\TESTContinuity\ImageDrop\Bank of America"
SET folderCCS="C:\TESTContinuity\ImageDrop\ComputerShare"
SET folderJPM="C:\TESTContinuity\ImageDrop\JPMorgan Chase Bank, NA"
SET folderNCP="C:\TESTContinuity\ImageDrop\NCP_Documents"
SET folderWF="C:\TESTContinuity\ImageDrop\Wells Fargo"

SET day=%Date:~7,2%
SET month=%Date:~4,2%
SET year=%Date:~10,4%
SET logFile="C:\TESTContinuity\Logs\"%year%"-"%month%"-"%day%"_ContWatchLog.txt"
SET varFile=C:\TESTContinuity\Logs\ContVarFile.txt

SET countBOA=0
SET countCCS=0
SET countJPM=0
SET countNCP=0
SET countWF=0

REM log each run?
ECHO. >> %logFile%
ECHO. >> %logFile%
ECHO ################################################################################################## >> %logFile%
ECHO %date% %time% Continuity Watch Ran to check for files >> %logFile%
ECHO ################################################################################################## >> %logFile%

REM load variables
FOR /F "tokens=1,2,3,4,5 delims=" %%a in (%varFile%) DO (
	SET oldCountBOA=%%a
	SET oldCountCCS=%%b
	SET oldCountJPM=%%c
	SET oldCountNCP=%%d
	SET oldCountWF=%%e
)
ECHO Last BOA Count - %oldCountBOA% >> %logFile%
ECHO Last CCS Count - %oldCountCCS% >> %logFile%
ECHO Last JPM Count - %oldCountJPM% >> %logFile%
ECHO Last NCP Count - %oldCountNCP% >> %logFile%
ECHO Last WF Count - %oldCountWF% >> %logFile%

REM check if service is running
FOR /F "tokens=3 delims=: " %%H in ('sc query "ContinuityService" ^| findstr "        STATE"') DO (
  IF /I "%%H" NEQ "RUNNING" (
   REM Put your code you want to execute here
   REM For example, the following line
   REM net start "MyServiceName"
   ECHO * * * * CONTINUTITY SERVICE IS NOT RUNNING! * * * * >> %logFile%
  ) 
)

REM BOA
FOR %%A in (%folderBOA%\*) DO (
		SET /A countBOA+=1
	)
IF %countBOA% GTR 0 (
	ECHO. >> %logFile%
	ECHO ================================================================================================== >> %logFile%
	ECHO %date% %time% Bank of America %countBOA% Files @ %folderBOA% >> %logFile%
	ECHO -------------------------------------------------------------------------------------------------- >> %logFile%
	PUSHD %folderBOA%
	DIR /A-D /B >> %logFile%
	POPD
	
	MSG * %countBOA% "Files in Bank of America folder."
)

REM CCS
FOR %%A in (%folderCCS%\*) DO (
		SET /A countCCS+=1
	)
IF %countCCS% GTR 0 (
	ECHO. >> %logFile%
	ECHO ================================================================================================== >> %logFile%
	ECHO %date% %time% Computer Share %countCCS% Files @ %folderCCS% >> %logFile%
	ECHO -------------------------------------------------------------------------------------------------- >> %logFile%
	PUSHD %folderCCS%
	DIR /A-D /B >> %logFile%
	POPD
	
	MSG * %countCCS% "Files in Computer Share folder."
)

REM JPM
FOR %%A in (%folderJPM%\*) DO (
		SET /A countJPM+=1
	)
IF %countJPM% GTR 0 (
	ECHO. >> %logFile%
	ECHO ================================================================================================== >> %logFile%
	ECHO %date% %time% JPMorgan Chase Bank, NA %countJPM% Files @ %folderJPM% >> %logFile%
	ECHO -------------------------------------------------------------------------------------------------- >> %logFile%
	PUSHD %folderJPM%
	DIR /A-D /B >> %logFile%
	POPD
	
	MSG * %countJPM% "Files in JPMorgan Chase Bank, NA folder."
)

REM NCP
FOR %%A in (%folderNCP%\*) DO (
		SET /A countNCP+=1
	)
IF %countNCP% GTR 0 (
	ECHO. >> %logFile%
	ECHO ================================================================================================== >> %logFile%
	ECHO %date% %time% NCP Documents %countNCP% Files @ %folderNCP% >> %logFile%
	ECHO -------------------------------------------------------------------------------------------------- >> %logFile%
	PUSHD %folderNCP%
	DIR /A-D /B >> %logFile%
	POPD
	
	MSG * %countNCP% "Files in NCP Documents folder."
)

REM WF
PUSHD %folderWF%
for /F %%N in ('dir/s/b/a-d 2^>nul ^| find /v /c ""') do set countWF=%%N
POPD
REM FOR %%A in (%folderWF%\*) DO (
REM 		SET /A countWF+=1
REM 	)
IF %countWF% GTR 0 (
	ECHO. >> %logFile%
	ECHO ================================================================================================== >> %logFile%
	ECHO %date% %time% Wells Fargo %countWF% Files @ %folderWF% >> %logFile%
	ECHO -------------------------------------------------------------------------------------------------- >> %logFile%
	PUSHD %folderWF%
	DIR /S /A-D /B >> %logFile%
	POPD
	
	MSG * %countWF% "Files in Wells Fargo folder."
)

REM SAVE VARIABLES 	
ECHO %countBOA% >> %varFile%
ECHO %countCCS% >> %varFile%
ECHO %countJPM% >> %varFile%
ECHO %countNCP% >> %varFile%
ECHO %countWF% >> %varFile%