IF OBJECT_ID ('TempDb..#Sales_Goals') IS NOT NULL
DROP TABLE #Sales_Goals

Create Table #Sales_Goals
(
        Community_Code      varchar(300),
        Period          	varchar (3),
        Measure        		int,
		Goal				int
)

insert into #Sales_Goals select 'lenl','WK',10,5
insert into #Sales_Goals select 'lenl','MTD',10,20
insert into #Sales_Goals select 'lenl','WK',20,15
insert into #Sales_Goals select 'lenl','MTD',20,60
insert into #Sales_Goals select 'lenl','WK',30,15
insert into #Sales_Goals select 'lenl','MTD',30,60
insert into #Sales_Goals select 'lenl','WK',40,5
insert into #Sales_Goals select 'lenl','MTD',40,20
insert into #Sales_Goals select 'lenl','WK',50,2
insert into #Sales_Goals select 'lenl','MTD',50,8
insert into #Sales_Goals select 'lenl','MTD',60,4
insert into #Sales_Goals select 'lenl','MTD',70,4
insert into #Sales_Goals select 'lenc','WK',10,5
insert into #Sales_Goals select 'lenc','MTD',10,20
insert into #Sales_Goals select 'lenc','WK',20,15
insert into #Sales_Goals select 'lenc','MTD',20,60
insert into #Sales_Goals select 'lenc','WK',30,15
insert into #Sales_Goals select 'lenc','MTD',30,60
insert into #Sales_Goals select 'lenc','WK',40,5
insert into #Sales_Goals select 'lenc','MTD',40,20
insert into #Sales_Goals select 'lenc','WK',50,2
insert into #Sales_Goals select 'lenc','MTD',50,8
insert into #Sales_Goals select 'lenc','MTD',60,4
insert into #Sales_Goals select 'lenc','MTD',70,4
insert into #Sales_Goals select 'powl','WK',10,5
insert into #Sales_Goals select 'powl','MTD',10,20
insert into #Sales_Goals select 'powl','WK',20,15
insert into #Sales_Goals select 'powl','MTD',20,60
insert into #Sales_Goals select 'powl','WK',30,20
insert into #Sales_Goals select 'powl','MTD',30,80
insert into #Sales_Goals select 'powl','WK',40,5
insert into #Sales_Goals select 'powl','MTD',40,20
insert into #Sales_Goals select 'powl','WK',50,2
insert into #Sales_Goals select 'powl','MTD',50,8
insert into #Sales_Goals select 'powl','MTD',60,4
insert into #Sales_Goals select 'powl','MTD',70,4
insert into #Sales_Goals select 'hixn','WK',10,5
insert into #Sales_Goals select 'hixn','MTD',10,20
insert into #Sales_Goals select 'hixn','WK',20,15
insert into #Sales_Goals select 'hixn','MTD',20,60
insert into #Sales_Goals select 'hixn','WK',30,20
insert into #Sales_Goals select 'hixn','MTD',30,80
insert into #Sales_Goals select 'hixn','WK',40,5
insert into #Sales_Goals select 'hixn','MTD',40,20
insert into #Sales_Goals select 'hixn','WK',50,2
insert into #Sales_Goals select 'hixn','MTD',50,8
insert into #Sales_Goals select 'hixn','MTD',60,4
insert into #Sales_Goals select 'hixn','MTD',70,4
insert into #Sales_Goals select 'frkl','WK',10,5
insert into #Sales_Goals select 'frkl','MTD',10,20
insert into #Sales_Goals select 'frkl','WK',20,15
insert into #Sales_Goals select 'frkl','MTD',20,60
insert into #Sales_Goals select 'frkl','WK',30,15
insert into #Sales_Goals select 'frkl','MTD',30,60
insert into #Sales_Goals select 'frkl','WK',40,5
insert into #Sales_Goals select 'frkl','MTD',40,20
insert into #Sales_Goals select 'frkl','WK',50,2
insert into #Sales_Goals select 'frkl','MTD',50,8
insert into #Sales_Goals select 'frkl','MTD',60,4
insert into #Sales_Goals select 'frkl','MTD',70,4
insert into #Sales_Goals select 'frkt','WK',10,5
insert into #Sales_Goals select 'frkt','WK',20,15
insert into #Sales_Goals select 'frkt','WK',30,15
insert into #Sales_Goals select 'frkt','WK',40,5
insert into #Sales_Goals select 'frkt','WK',50,2
insert into #Sales_Goals select 'frkt','MTD',10,20
insert into #Sales_Goals select 'frkt','MTD',20,60
insert into #Sales_Goals select 'frkt','MTD',30,60
insert into #Sales_Goals select 'frkt','MTD',40,20
insert into #Sales_Goals select 'frkt','MTD',50,8
insert into #Sales_Goals select 'frkt','MTD',60,4
insert into #Sales_Goals select 'frkt','MTD',70,4
insert into #Sales_Goals select 'lvll','WK',10,5
insert into #Sales_Goals select 'lvll','MTD',10,20
insert into #Sales_Goals select 'lvll','WK',20,35
insert into #Sales_Goals select 'lvll','MTD',20,140
insert into #Sales_Goals select 'lvll','WK',30,20
insert into #Sales_Goals select 'lvll','MTD',30,80
insert into #Sales_Goals select 'lvll','WK',40,5
insert into #Sales_Goals select 'lvll','MTD',40,20
insert into #Sales_Goals select 'lvll','WK',50,2
insert into #Sales_Goals select 'lvll','MTD',50,8
insert into #Sales_Goals select 'lvll','MTD',60,4
insert into #Sales_Goals select 'lvll','MTD',70,4
insert into #Sales_Goals select 'frln','WK',10,5
insert into #Sales_Goals select 'frln','MTD',10,20
insert into #Sales_Goals select 'frln','WK',20,15
insert into #Sales_Goals select 'frln','MTD',20,60
insert into #Sales_Goals select 'frln','WK',30,20
insert into #Sales_Goals select 'frln','MTD',30,80
insert into #Sales_Goals select 'frln','WK',40,5
insert into #Sales_Goals select 'frln','MTD',40,20
insert into #Sales_Goals select 'frln','WK',50,2
insert into #Sales_Goals select 'frln','MTD',50,8
insert into #Sales_Goals select 'frln','MTD',60,4
insert into #Sales_Goals select 'frln','MTD',70,4
insert into #Sales_Goals select 'calh','WK',10,5
insert into #Sales_Goals select 'calh','WK',20,15
insert into #Sales_Goals select 'calh','WK',30,20
insert into #Sales_Goals select 'calh','WK',40,5
insert into #Sales_Goals select 'calh','WK',50,2
insert into #Sales_Goals select 'calh','MTD',10,20
insert into #Sales_Goals select 'calh','MTD',20,60
insert into #Sales_Goals select 'calh','MTD',30,80
insert into #Sales_Goals select 'calh','MTD',40,20
insert into #Sales_Goals select 'calh','MTD',50,8
insert into #Sales_Goals select 'calh','MTD',60,4
insert into #Sales_Goals select 'calh','MTD',70,4
insert into #Sales_Goals select 'chtt','WK',10,5
insert into #Sales_Goals select 'chtt','WK',20,15
insert into #Sales_Goals select 'chtt','WK',30,20
insert into #Sales_Goals select 'chtt','WK',40,5
insert into #Sales_Goals select 'chtt','WK',50,2
insert into #Sales_Goals select 'chtt','MTD',10,20
insert into #Sales_Goals select 'chtt','MTD',20,60
insert into #Sales_Goals select 'chtt','MTD',30,80
insert into #Sales_Goals select 'chtt','MTD',40,20
insert into #Sales_Goals select 'chtt','MTD',50,8
insert into #Sales_Goals select 'chtt','MTD',60,4
insert into #Sales_Goals select 'chtt','MTD',70,4
insert into #Sales_Goals select 'cgdl','WK',10,5
insert into #Sales_Goals select 'cgdl','WK',20,15
insert into #Sales_Goals select 'cgdl','WK',30,15
insert into #Sales_Goals select 'cgdl','WK',40,5
insert into #Sales_Goals select 'cgdl','WK',50,2
insert into #Sales_Goals select 'cgdl','MTD',10,20
insert into #Sales_Goals select 'cgdl','MTD',20,60
insert into #Sales_Goals select 'cgdl','MTD',30,60
insert into #Sales_Goals select 'cgdl','MTD',40,20
insert into #Sales_Goals select 'cgdl','MTD',50,8
insert into #Sales_Goals select 'cgdl','MTD',60,4
insert into #Sales_Goals select 'cgdl','MTD',70,4
insert into #Sales_Goals select 'danv','WK',10,5
insert into #Sales_Goals select 'danv','WK',20,15
insert into #Sales_Goals select 'danv','WK',30,20
insert into #Sales_Goals select 'danv','WK',40,5
insert into #Sales_Goals select 'danv','WK',50,2
insert into #Sales_Goals select 'danv','MTD',10,20
insert into #Sales_Goals select 'danv','MTD',20,60
insert into #Sales_Goals select 'danv','MTD',30,80
insert into #Sales_Goals select 'danv','MTD',40,20
insert into #Sales_Goals select 'danv','MTD',50,8
insert into #Sales_Goals select 'danv','MTD',60,4
insert into #Sales_Goals select 'danv','MTD',70,4
insert into #Sales_Goals select 'lexn','WK',10,5
insert into #Sales_Goals select 'lexn','WK',20,35
insert into #Sales_Goals select 'lexn','WK',30,20
insert into #Sales_Goals select 'lexn','WK',40,5
insert into #Sales_Goals select 'lexn','WK',50,2
insert into #Sales_Goals select 'lexn','MTD',10,20
insert into #Sales_Goals select 'lexn','MTD',20,140
insert into #Sales_Goals select 'lexn','MTD',30,80
insert into #Sales_Goals select 'lexn','MTD',40,20
insert into #Sales_Goals select 'lexn','MTD',50,8
insert into #Sales_Goals select 'lexn','MTD',60,4
insert into #Sales_Goals select 'lexn','MTD',70,4
insert into #Sales_Goals select 'lexl','WK',10,5
insert into #Sales_Goals select 'lexl','WK',20,35
insert into #Sales_Goals select 'lexl','WK',30,20
insert into #Sales_Goals select 'lexl','WK',40,5
insert into #Sales_Goals select 'lexl','WK',50,2
insert into #Sales_Goals select 'lexl','MTD',10,20
insert into #Sales_Goals select 'lexl','MTD',20,140
insert into #Sales_Goals select 'lexl','MTD',30,80
insert into #Sales_Goals select 'lexl','MTD',40,20
insert into #Sales_Goals select 'lexl','MTD',50,8
insert into #Sales_Goals select 'lexl','MTD',60,4
insert into #Sales_Goals select 'lexl','MTD',70,4
insert into #Sales_Goals select 'lexe','WK',10,5
insert into #Sales_Goals select 'lexe','WK',20,15
insert into #Sales_Goals select 'lexe','WK',30,20
insert into #Sales_Goals select 'lexe','WK',40,5
insert into #Sales_Goals select 'lexe','WK',50,2
insert into #Sales_Goals select 'lexe','MTD',10,20
insert into #Sales_Goals select 'lexe','MTD',20,60
insert into #Sales_Goals select 'lexe','MTD',30,80
insert into #Sales_Goals select 'lexe','MTD',40,20
insert into #Sales_Goals select 'lexe','MTD',50,8
insert into #Sales_Goals select 'lexe','MTD',60,4
insert into #Sales_Goals select 'lexe','MTD',70,4
insert into #Sales_Goals select 'rich','WK',10,1
insert into #Sales_Goals select 'rich','WK',20,4
insert into #Sales_Goals select 'rich','WK',30,10
insert into #Sales_Goals select 'rich','WK',40,5
insert into #Sales_Goals select 'rich','WK',50,1
insert into #Sales_Goals select 'rich','MTD',10,4
insert into #Sales_Goals select 'rich','MTD',20,16
insert into #Sales_Goals select 'rich','MTD',30,40
insert into #Sales_Goals select 'rich','MTD',40,20
insert into #Sales_Goals select 'rich','MTD',50,4
insert into #Sales_Goals select 'rich','MTD',60,4
insert into #Sales_Goals select 'rich','MTD',70,4
insert into #Sales_Goals select 'lvlm','WK',10,5
insert into #Sales_Goals select 'lvlm','WK',20,35
insert into #Sales_Goals select 'lvlm','WK',30,20
insert into #Sales_Goals select 'lvlm','WK',40,5
insert into #Sales_Goals select 'lvlm','WK',50,2
insert into #Sales_Goals select 'lvlm','MTD',10,20
insert into #Sales_Goals select 'lvlm','MTD',20,140
insert into #Sales_Goals select 'lvlm','MTD',30,80
insert into #Sales_Goals select 'lvlm','MTD',40,20
insert into #Sales_Goals select 'lvlm','MTD',50,8
insert into #Sales_Goals select 'lvlm','MTD',60,4
insert into #Sales_Goals select 'lvlm','MTD',70,4
insert into #Sales_Goals select 'brwd','WK',10,5
insert into #Sales_Goals select 'brwd','WK',20,15
insert into #Sales_Goals select 'brwd','WK',30,20
insert into #Sales_Goals select 'brwd','WK',40,5
insert into #Sales_Goals select 'brwd','WK',50,2
insert into #Sales_Goals select 'brwd','MTD',10,20
insert into #Sales_Goals select 'brwd','MTD',20,60
insert into #Sales_Goals select 'brwd','MTD',30,80
insert into #Sales_Goals select 'brwd','MTD',40,20
insert into #Sales_Goals select 'brwd','MTD',50,8
insert into #Sales_Goals select 'brwd','MTD',60,4
insert into #Sales_Goals select 'brwd','MTD',70,4
insert into #Sales_Goals select 'colm','WK',10,1
insert into #Sales_Goals select 'colm','WK',20,4
insert into #Sales_Goals select 'colm','WK',30,10
insert into #Sales_Goals select 'colm','WK',40,5
insert into #Sales_Goals select 'colm','WK',50,1
insert into #Sales_Goals select 'colm','MTD',10,4
insert into #Sales_Goals select 'colm','MTD',20,16
insert into #Sales_Goals select 'colm','MTD',30,40
insert into #Sales_Goals select 'colm','MTD',40,20
insert into #Sales_Goals select 'colm','MTD',50,4
insert into #Sales_Goals select 'colm','MTD',60,4
insert into #Sales_Goals select 'colm','MTD',70,4

insert into #Sales_Goals select 'sprh','WK',10,5
insert into #Sales_Goals select 'sprh','WK',20,15 
insert into #Sales_Goals select 'sprh','WK',30,20
insert into #Sales_Goals select 'sprh','WK',40,5
insert into #Sales_Goals select 'sprh','WK',50,2
insert into #Sales_Goals select 'sprh','MTD',10,20
insert into #Sales_Goals select 'sprh','MTD',20,140
insert into #Sales_Goals select 'sprh','MTD',30,80
insert into #Sales_Goals select 'sprh','MTD',40,20
insert into #Sales_Goals select 'sprh','MTD',50,8
insert into #Sales_Goals select 'sprh','MTD',60,4
insert into #Sales_Goals select 'sprh','MTD',70,4
insert into #Sales_Goals select 'tula','WK',10,1
insert into #Sales_Goals select 'tula','WK',20,4
insert into #Sales_Goals select 'tula','WK',30,10
insert into #Sales_Goals select 'tula','WK',40,5
insert into #Sales_Goals select 'tula','WK',50,1
insert into #Sales_Goals select 'tula','MTD',10,4
insert into #Sales_Goals select 'tula','MTD',20,16
insert into #Sales_Goals select 'tula','MTD',30,40
insert into #Sales_Goals select 'tula','MTD',40,20
insert into #Sales_Goals select 'tula','MTD',50,4
insert into #Sales_Goals select 'tula','MTD',60,4
insert into #Sales_Goals select 'tula','MTD',70,4
insert into #Sales_Goals select 'tusc','WK',10,5
insert into #Sales_Goals select 'tusc','WK',20,15
insert into #Sales_Goals select 'tusc','WK',30,20
insert into #Sales_Goals select 'tusc','WK',40,5
insert into #Sales_Goals select 'tusc','WK',50,2
insert into #Sales_Goals select 'tusc','MTD',10,20
insert into #Sales_Goals select 'tusc','MTD',20,60
insert into #Sales_Goals select 'tusc','MTD',30,80
insert into #Sales_Goals select 'tusc','MTD',40,20
insert into #Sales_Goals select 'tusc','MTD',50,8
insert into #Sales_Goals select 'tusc','MTD',60,4
insert into #Sales_Goals select 'tusc','MTD',70,4
insert into #Sales_Goals select 'aths','WK',10,1
insert into #Sales_Goals select 'aths','WK',20,4
insert into #Sales_Goals select 'aths','WK',30,10
insert into #Sales_Goals select 'aths','WK',40,5
insert into #Sales_Goals select 'aths','WK',50,1
insert into #Sales_Goals select 'aths','MTD',10,4
insert into #Sales_Goals select 'aths','MTD',20,16
insert into #Sales_Goals select 'aths','MTD',30,40
insert into #Sales_Goals select 'aths','MTD',40,20
insert into #Sales_Goals select 'aths','MTD',50,4
insert into #Sales_Goals select 'aths','MTD',60,4
insert into #Sales_Goals select 'aths','MTD',70,4
insert into #Sales_Goals select 'grnv','WK',10,1
insert into #Sales_Goals select 'grnv','WK',20,4
insert into #Sales_Goals select 'grnv','WK',30,10
insert into #Sales_Goals select 'grnv','WK',40,5
insert into #Sales_Goals select 'grnv','WK',50,1
insert into #Sales_Goals select 'grnv','MTD',10,4
insert into #Sales_Goals select 'grnv','MTD',20,16
insert into #Sales_Goals select 'grnv','MTD',30,40
insert into #Sales_Goals select 'grnv','MTD',40,20
insert into #Sales_Goals select 'grnv','MTD',50,4
insert into #Sales_Goals select 'grnv','MTD',60,4
insert into #Sales_Goals select 'grnv','MTD',70,4
insert into #Sales_Goals select 'knox','WK',10,5
insert into #Sales_Goals select 'knox','WK',20,35
insert into #Sales_Goals select 'knox','WK',30,20
insert into #Sales_Goals select 'knox','WK',40,5
insert into #Sales_Goals select 'knox','WK',50,2
insert into #Sales_Goals select 'knox','MTD',10,20
insert into #Sales_Goals select 'knox','MTD',20,140
insert into #Sales_Goals select 'knox','MTD',30,80
insert into #Sales_Goals select 'knox','MTD',40,20
insert into #Sales_Goals select 'knox','MTD',50,8
insert into #Sales_Goals select 'knox','MTD',60,4
insert into #Sales_Goals select 'knox','MTD',70,4
insert into #Sales_Goals select 'eham','WK',10,5
insert into #Sales_Goals select 'eham','WK',20,15
insert into #Sales_Goals select 'eham','WK',30,20
insert into #Sales_Goals select 'eham','WK',40,5
insert into #Sales_Goals select 'eham','WK',50,2
insert into #Sales_Goals select 'eham','MTD',10,20
insert into #Sales_Goals select 'eham','MTD',20,60
insert into #Sales_Goals select 'eham','MTD',30,80
insert into #Sales_Goals select 'eham','MTD',40,20
insert into #Sales_Goals select 'eham','MTD',50,8
insert into #Sales_Goals select 'eham','MTD',60,4
insert into #Sales_Goals select 'eham','MTD',70,4
/* 2019-10-02 Changed Goals */
/* Replaced on 2019-12-11
insert into #Sales_Goals select 'fktl','WK',10,1
insert into #Sales_Goals select 'fktl','WK',20,4
insert into #Sales_Goals select 'fktl','WK',30,10
insert into #Sales_Goals select 'fktl','WK',40,5
insert into #Sales_Goals select 'fktl','WK',50,1
insert into #Sales_Goals select 'fktl','MTD',10,4
insert into #Sales_Goals select 'fktl','MTD',20,16
insert into #Sales_Goals select 'fktl','MTD',30,40
insert into #Sales_Goals select 'fktl','MTD',40,20
insert into #Sales_Goals select 'fktl','MTD',50,4
insert into #Sales_Goals select 'fktl','MTD',60,4
insert into #Sales_Goals select 'fktl','MTD',70,4
*/



/* 2020-03-04 Changed Goals */
insert into #Sales_Goals select 'chtl','WK',10,1
insert into #Sales_Goals select 'chtl','WK',20,4
insert into #Sales_Goals select 'chtl','WK',30,10
insert into #Sales_Goals select 'chtl','WK',40,5
insert into #Sales_Goals select 'chtl','WK',50,1
insert into #Sales_Goals select 'chtl','MTD',10,5
insert into #Sales_Goals select 'chtl','MTD',20,15
insert into #Sales_Goals select 'chtl','MTD',30,20
insert into #Sales_Goals select 'chtl','MTD',40,5
insert into #Sales_Goals select 'chtl','MTD',50,2
insert into #Sales_Goals select 'chtl','MTD',60,4
insert into #Sales_Goals select 'chtl','MTD',70,4

insert into #Sales_Goals select 'grnb','WK',10,5
insert into #Sales_Goals select 'grnb','WK',20,15
insert into #Sales_Goals select 'grnb','WK',30,15
insert into #Sales_Goals select 'grnb','WK',40,5
insert into #Sales_Goals select 'grnb','WK',50,2
insert into #Sales_Goals select 'grnb','MTD',10,20
insert into #Sales_Goals select 'grnb','MTD',20,60
insert into #Sales_Goals select 'grnb','MTD',30,60
insert into #Sales_Goals select 'grnb','MTD',40,20
insert into #Sales_Goals select 'grnb','MTD',50,8
insert into #Sales_Goals select 'grnb','MTD',60,4
insert into #Sales_Goals select 'grnb','MTD',70,4

insert into #Sales_Goals select 'sprl','WK',10,5
insert into #Sales_Goals select 'sprl','WK',20,15 
insert into #Sales_Goals select 'sprl','WK',30,20  
insert into #Sales_Goals select 'sprl','WK',40,5
insert into #Sales_Goals select 'sprl','WK',50,2
insert into #Sales_Goals select 'sprl','MTD',10,20
insert into #Sales_Goals select 'sprl','MTD',20,140
insert into #Sales_Goals select 'sprl','MTD',30,60
insert into #Sales_Goals select 'sprl','MTD',40,20
insert into #Sales_Goals select 'sprl','MTD',50,8
insert into #Sales_Goals select 'sprl','MTD',60,4
insert into #Sales_Goals select 'sprl','MTD',70,4

insert into #Sales_Goals select 'clin','WK',10,1
insert into #Sales_Goals select 'clin','WK',20,4
insert into #Sales_Goals select 'clin','WK',30,10
insert into #Sales_Goals select 'clin','WK',40,5
insert into #Sales_Goals select 'clin','WK',50,1
insert into #Sales_Goals select 'clin','MTD',10,4
insert into #Sales_Goals select 'clin','MTD',20,16
insert into #Sales_Goals select 'clin','MTD',30,40
insert into #Sales_Goals select 'clin','MTD',40,20
insert into #Sales_Goals select 'clin','MTD',50,4
insert into #Sales_Goals select 'clin','MTD',60,4
insert into #Sales_Goals select 'clin','MTD',70,4

/* 2020-07-31 Added Goal for Knoxville Lantern */
insert into #Sales_Goals select 'knxl','WK',10,5
insert into #Sales_Goals select 'knxl','WK',20,35
insert into #Sales_Goals select 'knxl','WK',30,20
insert into #Sales_Goals select 'knxl','WK',40,5
insert into #Sales_Goals select 'knxl','WK',50,2
insert into #Sales_Goals select 'knxl','MTD',10,20
insert into #Sales_Goals select 'knxl','MTD',20,140
insert into #Sales_Goals select 'knxl','MTD',30,80
insert into #Sales_Goals select 'knxl','MTD',40,20
insert into #Sales_Goals select 'knxl','MTD',50,8
insert into #Sales_Goals select 'knxl','MTD',60,4
insert into #Sales_Goals select 'knxl','MTD',70,4

/* 2020-10-30 Changed Goal for Franklins */
insert into #Sales_Goals select 'fktn','WK',10,5
insert into #Sales_Goals select 'fktn','WK',20,15
insert into #Sales_Goals select 'fktn','WK',30,20
insert into #Sales_Goals select 'fktn','WK',40,5
insert into #Sales_Goals select 'fktn','WK',50,2
insert into #Sales_Goals select 'fktn','MTD',10,20
insert into #Sales_Goals select 'fktn','MTD',20,140
insert into #Sales_Goals select 'fktn','MTD',30,80
insert into #Sales_Goals select 'fktn','MTD',40,20
insert into #Sales_Goals select 'fktn','MTD',50,8
insert into #Sales_Goals select 'fktn','MTD',60,4
insert into #Sales_Goals select 'fktn','MTD',70,4

insert into #Sales_Goals select 'fktl','WK',10,5
insert into #Sales_Goals select 'fktl','WK',20,15
insert into #Sales_Goals select 'fktl','WK',30,20
insert into #Sales_Goals select 'fktl','WK',40,5
insert into #Sales_Goals select 'fktl','WK',50,2
insert into #Sales_Goals select 'fktl','MTD',10,20
insert into #Sales_Goals select 'fktl','MTD',20,140
insert into #Sales_Goals select 'fktl','MTD',30,80
insert into #Sales_Goals select 'fktl','MTD',40,20
insert into #Sales_Goals select 'fktl','MTD',50,8
insert into #Sales_Goals select 'fktl','MTD',60,4
insert into #Sales_Goals select 'fktl','MTD',70,4

/* 2021-02-25 Changed Goal for Russells */
insert into #Sales_Goals select 'russ','WK',10,5
insert into #Sales_Goals select 'russ','WK',20,22
insert into #Sales_Goals select 'russ','WK',30,15
insert into #Sales_Goals select 'russ','WK',40,5
insert into #Sales_Goals select 'russ','WK',50,2
insert into #Sales_Goals select 'russ','MTD',10,20
insert into #Sales_Goals select 'russ','MTD',20,60
insert into #Sales_Goals select 'russ','MTD',30,60
insert into #Sales_Goals select 'russ','MTD',40,20
insert into #Sales_Goals select 'russ','MTD',50,8
insert into #Sales_Goals select 'russ','MTD',60,4
insert into #Sales_Goals select 'russ','MTD',70,4
insert into #Sales_Goals select 'rusl','WK',10,5
insert into #Sales_Goals select 'rusl','WK',20,22
insert into #Sales_Goals select 'rusl','WK',30,15
insert into #Sales_Goals select 'rusl','WK',40,5
insert into #Sales_Goals select 'rusl','WK',50,2
insert into #Sales_Goals select 'rusl','MTD',10,20
insert into #Sales_Goals select 'rusl','MTD',20,60
insert into #Sales_Goals select 'rusl','MTD',30,60
insert into #Sales_Goals select 'rusl','MTD',40,20
insert into #Sales_Goals select 'rusl','MTD',50,8
insert into #Sales_Goals select 'rusl','MTD',60,4
insert into #Sales_Goals select 'rusl','MTD',70,4


/*CHANGED: added goals for HARD 4-12-2022*/
insert into #Sales_Goals select 'hard','WK',10,5
insert into #Sales_Goals select 'hard','WK',20,15
insert into #Sales_Goals select 'hard','WK',30,20
insert into #Sales_Goals select 'hard','WK',40,5
insert into #Sales_Goals select 'hard','WK',50,2
insert into #Sales_Goals select 'hard','MTD',10,20
insert into #Sales_Goals select 'hard','MTD',20,60
insert into #Sales_Goals select 'hard','MTD',30,80
insert into #Sales_Goals select 'hard','MTD',40,20
insert into #Sales_Goals select 'hard','MTD',50,8
insert into #Sales_Goals select 'hard','MTD',60,4
insert into #Sales_Goals select 'hard','MTD',70,4

/*CHANGED: added goals for HARD 4-12-2022*/
insert into #Sales_Goals select 'hard','WK',10,5
insert into #Sales_Goals select 'hard','WK',20,15
insert into #Sales_Goals select 'hard','WK',30,20
insert into #Sales_Goals select 'hard','WK',40,5
insert into #Sales_Goals select 'hard','WK',50,2
insert into #Sales_Goals select 'hard','MTD',10,20
insert into #Sales_Goals select 'hard','MTD',20,60
insert into #Sales_Goals select 'hard','MTD',30,80
insert into #Sales_Goals select 'hard','MTD',40,20
insert into #Sales_Goals select 'hard','MTD',50,8
insert into #Sales_Goals select 'hard','MTD',60,4
insert into #Sales_Goals select 'hard','MTD',70,4


/*CHANGED: NEW GOALS FOR SALESMAIL 5-12-2022 */
insert into #Sales_Goals select 'aths','WK',59,9999
insert into #Sales_Goals select 'brwd','WK',59,5
insert into #Sales_Goals select 'calh','WK',59,5
insert into #Sales_Goals select 'cgdl','WK',59,5
insert into #Sales_Goals select 'chtl','WK',59,5
insert into #Sales_Goals select 'chtt','WK',59,5
insert into #Sales_Goals select 'clin','WK',59,5
insert into #Sales_Goals select 'colm','WK',59,5
insert into #Sales_Goals select 'danv','WK',59,5
insert into #Sales_Goals select 'eham','WK',59,5
insert into #Sales_Goals select 'fktl','WK',59,5
insert into #Sales_Goals select 'fktn','WK',59,5
insert into #Sales_Goals select 'frkl','WK',59,5
insert into #Sales_Goals select 'frkt','WK',59,5
insert into #Sales_Goals select 'frln','WK',59,5
insert into #Sales_Goals select 'grnb','WK',59,5
insert into #Sales_Goals select 'grnv','WK',59,5
insert into #Sales_Goals select 'hard','WK',59,5
insert into #Sales_Goals select 'hixn','WK',59,5
insert into #Sales_Goals select 'knox','WK',59,5
insert into #Sales_Goals select 'knxl','WK',59,5
insert into #Sales_Goals select 'lenc','WK',59,5
insert into #Sales_Goals select 'lenl','WK',59,5
insert into #Sales_Goals select 'lexe','WK',59,5
insert into #Sales_Goals select 'lexl','WK',59,5
insert into #Sales_Goals select 'lexn','WK',59,5
insert into #Sales_Goals select 'lvll','WK',59,5
insert into #Sales_Goals select 'lvlm','WK',59,5
insert into #Sales_Goals select 'powl','WK',59,5
insert into #Sales_Goals select 'rich','WK',59,5
insert into #Sales_Goals select 'rusl','WK',59,5
insert into #Sales_Goals select 'russ','WK',59,5
insert into #Sales_Goals select 'sprh','WK',59,5
insert into #Sales_Goals select 'sprl','WK',59,5
insert into #Sales_Goals select 'tula','WK',59,5
insert into #Sales_Goals select 'tusc','WK',59,5
/*
insert into #Sales_Goals select 'aths','MTD',59,10
insert into #Sales_Goals select 'brwd','MTD',59,10
insert into #Sales_Goals select 'calh','MTD',59,10
insert into #Sales_Goals select 'cgdl','MTD',59,10
insert into #Sales_Goals select 'chtl','MTD',59,10
insert into #Sales_Goals select 'chtt','MTD',59,10
insert into #Sales_Goals select 'clin','MTD',59,10
insert into #Sales_Goals select 'colm','MTD',59,10
insert into #Sales_Goals select 'danv','MTD',59,10
insert into #Sales_Goals select 'eham','MTD',59,10
insert into #Sales_Goals select 'fktl','MTD',59,10
insert into #Sales_Goals select 'fktn','MTD',59,10
insert into #Sales_Goals select 'frkl','MTD',59,10
insert into #Sales_Goals select 'frkt','MTD',59,10
insert into #Sales_Goals select 'frln','MTD',59,10
insert into #Sales_Goals select 'grnb','MTD',59,10
insert into #Sales_Goals select 'grnv','MTD',59,10
insert into #Sales_Goals select 'hard','MTD',59,10
insert into #Sales_Goals select 'hixn','MTD',59,10
insert into #Sales_Goals select 'knox','MTD',59,10
insert into #Sales_Goals select 'knxl','MTD',59,10
insert into #Sales_Goals select 'lenc','MTD',59,10
insert into #Sales_Goals select 'lenl','MTD',59,10
insert into #Sales_Goals select 'lexe','MTD',59,10
insert into #Sales_Goals select 'lexl','MTD',59,10
insert into #Sales_Goals select 'lexn','MTD',59,10
insert into #Sales_Goals select 'lvll','MTD',59,10
insert into #Sales_Goals select 'lvlm','MTD',59,10
insert into #Sales_Goals select 'powl','MTD',59,10
insert into #Sales_Goals select 'rich','MTD',59,10
insert into #Sales_Goals select 'rusl','MTD',59,10
insert into #Sales_Goals select 'russ','MTD',59,10
insert into #Sales_Goals select 'sprh','MTD',59,10
insert into #Sales_Goals select 'sprl','MTD',59,10
insert into #Sales_Goals select 'tula','MTD',59,10
insert into #Sales_Goals select 'tusc','MTD',59,10
*/
insert into #Sales_Goals select 'aths','MTD',59,20
insert into #Sales_Goals select 'brwd','MTD',59,20
insert into #Sales_Goals select 'calh','MTD',59,20
insert into #Sales_Goals select 'cgdl','MTD',59,20
insert into #Sales_Goals select 'chtl','MTD',59,20
insert into #Sales_Goals select 'chtt','MTD',59,20
insert into #Sales_Goals select 'clin','MTD',59,20
insert into #Sales_Goals select 'colm','MTD',59,20
insert into #Sales_Goals select 'danv','MTD',59,20
insert into #Sales_Goals select 'eham','MTD',59,20
insert into #Sales_Goals select 'fktl','MTD',59,20
insert into #Sales_Goals select 'fktn','MTD',59,20
insert into #Sales_Goals select 'frkl','MTD',59,20
insert into #Sales_Goals select 'frkt','MTD',59,20
insert into #Sales_Goals select 'frln','MTD',59,20
insert into #Sales_Goals select 'grnb','MTD',59,20
insert into #Sales_Goals select 'grnv','MTD',59,20
insert into #Sales_Goals select 'hard','MTD',59,20
insert into #Sales_Goals select 'hixn','MTD',59,20
insert into #Sales_Goals select 'knox','MTD',59,20
insert into #Sales_Goals select 'knxl','MTD',59,20
insert into #Sales_Goals select 'lenc','MTD',59,20
insert into #Sales_Goals select 'lenl','MTD',59,20
insert into #Sales_Goals select 'lexe','MTD',59,20
insert into #Sales_Goals select 'lexl','MTD',59,20
insert into #Sales_Goals select 'lexn','MTD',59,20
insert into #Sales_Goals select 'lvll','MTD',59,20
insert into #Sales_Goals select 'lvlm','MTD',59,20
insert into #Sales_Goals select 'powl','MTD',59,20
insert into #Sales_Goals select 'rich','MTD',59,20
insert into #Sales_Goals select 'rusl','MTD',59,20
insert into #Sales_Goals select 'russ','MTD',59,20
insert into #Sales_Goals select 'sprh','MTD',59,20
insert into #Sales_Goals select 'sprl','MTD',59,20
insert into #Sales_Goals select 'tula','MTD',59,20
insert into #Sales_Goals select 'tusc','MTD',59,20

/* Quick query to produce new goals

select distinct('insert into #Sales_Goals select ''' + (community_code) + ''',''WK'+''',59,5') from #Sales_Goals 

select distinct('insert into #Sales_Goals select ''' + (community_code) + ''',''MTD'+''',59,10') from #Sales_Goals 

select distinct('insert into #Sales_Goals select ''' + (community_code) + ''',''LM'+''',59,20') from #Sales_Goals 
*/

insert into #Sales_Goals
select
Community_Code
,'LM'
,Measure
,Goal
from #Sales_Goals where Period = 'MTD' --order by measure desc


select * from #Sales_Goals  order by measure desc