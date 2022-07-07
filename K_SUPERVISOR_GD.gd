
[General]
Version=1

[Preferences]
Username=
Password=2107
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_SUPERVISOR
Count=600

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

[Record]
Name=COMMISSION
Type=LONG
Size=
Data=List(0.1, 0.2, 0.3, 0.4, 0.15, 0.27, 0.12, 0.24, 0.33, 0.36, 0.37, 0.11, 0.16)
Master=

