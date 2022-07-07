
[General]
Version=1

[Preferences]
Username=
Password=2980
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_PRODUCT
Count=7000

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=List(SELECT P_ID FROM PRODUCT)
Master=

[Record]
Name=C_ID
Type=NUMBER
Size=
Data=List(SELECT KC_ID FROM KOSHER_CERTIFICATE)
Master=


[Table]
Owner=
Name=
Count=10..20

