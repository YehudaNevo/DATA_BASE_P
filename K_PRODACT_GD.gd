
[General]
Version=1

[Preferences]
Username=
Password=2478
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_PRODACT
Count=800..1300

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=List(SELECT P_ID FROM PRODACT)
Master=

[Record]
Name=CERTIFICATE_ID
Type=NUMBER
Size=
Data=List(SELECT KC_ID FROM KOSHER_CERTIFICATE)
Master=

