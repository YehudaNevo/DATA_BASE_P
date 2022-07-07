
[General]
Version=1

[Preferences]
Username=
Password=2218
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=RESTAURANT
Count=2000

[Record]
Name=R_ID
Type=NUMBER
Size=
Data=[000000]
Master=

[Record]
Name=HEAD_CHEF
Type=VARCHAR2
Size=20
Data=FirstName + "_" + LastName
Master=

[Record]
Name=CITY
Type=VARCHAR2
Size=20
Data=List('JERUSALEM', 'TEL-AVIV', 'HAIFA', 'HOLON', 'BNEY-BRAK', 'EILAT','ASHDOD', 'GIVATAIM', 'RANANA', 'KIRYAT-ARBA', 'AKKO', 'NETENYA', 'KIRYAT=SHMONA', 'KATZRIN') ) +  
Master=

[Record]
Name=R_NAME
Type=VARCHAR2
Size=18
Data=List('MAADANY_', 'SHIPUDEY_', 'FLAFEL_', 'PIZZA_', 'SUSHI_', 'STECIAT_') + LIST('DAVID', 'YUDA', 'YONI', 'MOSHIKO', 'OFFER', 'DUDU','DANY', 'KING_BIBI', 'TIBI', 'KOKO', 'REFHAEL', 'ELI', 'DAN', 'BARAK', 'GAL', 'ZIV', 'ORI', 'NAFTALY', 'AVI', 'ITSIK', 'BENY'
='ARIEH')
Master=

