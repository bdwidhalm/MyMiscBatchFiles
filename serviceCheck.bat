@ECHO OFF
FOR /F "tokens=3 delims=: " %%H in ('sc query "ContinuityService" ^| findstr "        STATE"') DO (
  IF /I "%%H" NEQ "RUNNING" (
   REM Put your code you want to execute here
   REM For example, the following line
   REM net start "MyServiceName"
   ECHO * * * * CONTINUTITY SERVICE NOT RUNNING! * * * *
  ) 
)
PAUSE