
[General]
Version=1

[Preferences]
Username=
Password=2728
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PRODACT
Count=1500

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=[000000000]
Master=

[Record]
Name=F_ID
Type=NUMBER
Size=
Data=List(SELECT ID FROM FACTORY)
Master=

[Record]
Name=P_NAME
Type=VARCHAR2
Size=20
Data=[Aaaaaaa]
Master=

