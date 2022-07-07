
[General]
Version=1

[Preferences]
Username=
Password=2908
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_CERTIFICATE
Count=6000

[Record]
Name=KC_ID
Type=NUMBER
Size=
Data=[000000]
Master=

[Record]
Name=STRAT_DATE
Type=DATE
Size=
Data=Random(01/01/2015, 01/01/2020)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(01/01/2020, 01/01/2023)
Master=

[Record]
Name=K_LEVEL
Type=VARCHAR2
Size=20
Data=List(regular, mehadrin)
Master=

[Record]
Name=KS_ID
Type=NUMBER
Size=
Data=List(select KS_ID from kosher_supervisor)
Master=

[Record]
Name=PRICE_PM
Type=NUMBER
Size=
Data=Random(1000, 10000)
Master=

