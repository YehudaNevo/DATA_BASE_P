
[General]
Version=1

[Preferences]
Username=
Password=2512
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PRODUCT
Count=10000

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=[00000000]
Master=

[Record]
Name=P_NAME
Type=VARCHAR2
Size=20
Data=List('madan_', 'hatif_', 'mits_', 'hatifey_', 'ugat_', 'mashke_', 'glidat_', 'artik_', 'kartiv_') + List('shokolad_', 'gvina_', 'zeitim_', 'orez_', 'batzal_', 'soya_', 'bana_', 'ananas_', 'melon_' , 'avatiah_', 'toot_', 'limon_') + List('noShuger', 'withShuger', 'glotenFree', 'shugerFree' 'lite', 'dalShuman', 'dairy')
Master=

[Record]
Name=F_ID
Type=NUMBER
Size=
Data=List(select f_id from factory)
Master=

