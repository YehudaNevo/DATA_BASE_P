
[General]
Version=1

[Preferences]
Username=
Password=2535
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=KOSHER_RESTAURANT
Count=300..400

[Record]
Name=R_ID
Type=NUMBER
Size=
Data=List(SELECT R_ID FROM RESTAURANT)
Master=

[Record]
Name=CR_ID
Type=NUMBER
Size=
Data=List(SELECT KC_ID FROM KOSHER_CERTIFICATE)
Master=

