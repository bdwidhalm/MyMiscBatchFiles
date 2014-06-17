@ECHO OFF

SET smtpName="excprd01.specializedservicing.com"
SET toName="Brian.Widhalm@SLS.net"
SET fromName="NoReply@sls.net"
SET subjectLine="SQLPRD03 ALERT Cycle Complete Region 1"
SET bodyText="    TEST...TEST...TEST...TEST...TEST...TEST...TEST...TEST...TEST...TEST... "


bmail -s %smtpName% -t %toName% -f %fromName% -h -a %subjectLine% -b %bodyText%

