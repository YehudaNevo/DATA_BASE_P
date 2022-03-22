
[General]
Version=1

[Preferences]
=
Username=
Password=2434
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_SUPERVISOR
Count=100

[Record]
Name=KS_ID
Type=NUMBER
Size=
Data=[000000]
Master=

[Record]
Name=KS_NAME
Type=VARCHAR2
Size=20
Data=FirstName + LastName
Master=

[Record]
Name=KI_ID
Type=NUMBER
Size=
Data=List(select KI_ID from kosher_instetution)
Master=

[Record]
Name=KS_B_DATA
Type=DATE
Size=
Data=Random(01/01/1960, 01/01/2000)
Master=

