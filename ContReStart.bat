@ECHO OFF
SET service="Continuity Service"
NET STOP %service%
NET START %service%