/****** Script for SelectTopNRows command from SSMS  ******/

SELECT 
[hmyperson]
      ,[HPROPERTY]
      ,[saddr1]
      ,[scode]
      ,LEFT([SUNITCODE],3) as room
      ,[MOVEIN]
      ,[TIME_MOVEIN]
      ,ISNULL([MOVEOUT],cast('2100-01-01' as date)) as  MOVEOUT
      ,[TIME_MOVEOUT]
	 into #yardi
  FROM [CGDL].[dbo].[yardi_info]
  drop table #yardi


  select * from seniorprospect 
  select * from [yardi_info]
  select * from #yardi where hmyperson = 115957
   select * from [dbo].[ailment] where 
   --property like '%college%' 
   hperson = 115957

  SELECT b.hmyperson, b.movein,b.moveout, *
  FROM [CGDL].[dbo].[cgdl_rooms] a

  join #yardi b on a.room = b.room and a.start_date between b.[MOVEIN] and b.[MOVEOUT]
 -- join [dbo].[ailment] c on b.hmyperson = c.hperson
  order by b.hmyperson desc

  
 select * from [dbo].[ailment] where property like '%college%' order by startdate desc