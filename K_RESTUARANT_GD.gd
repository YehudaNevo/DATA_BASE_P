
[General]
Version=1

[Preferences]
Username=
Password=2037
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_RESTAURANT
Count=1000..1200

[Record]
Name=R_ID
Type=NUMBER
Size=
Data=List(SELECT R_ID FROM RESTAURANT)
Master=

[Record]
Name=KC_ID
Type=NUMBER
Size=
Data=List(SELECT KC_ID FROM KOSHER_CERTIFICATE)
Master=

