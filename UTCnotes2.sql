select * from [dbo].[TenantInfo]
select * from [dbo].[ailment] 
select * from [dbo].[cgdl_rooms]
select * from [dbo].[Medical_Yardi]

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [TenantID]
      ,[ProspectID]
      ,[DOB]
      ,[Gender]
      ,[PropertyID]
      ,[CommunityCode]
      ,[CommunityName],
   cast(LTRIM(RTRIM(ti.room)) as int) as ROOM
      ,[RoomCode]
      ,[DTmovein]
      ,[MoveInTime]
      ,[DTmoveout]
      ,[MoveOutTime]
into #test
  FROM [CGDL].[dbo].[TenantInfo] ti
  where  ti.ROOM not like '%[^0-9]%'

  select * from #test
  select CONCAT('cgdl','-',room) roomcode,* into #test2 from [dbo].[cgdl_rooms] 
  
  
  select * from #test ti
 --join [dbo].[ailment] ill on TI.prospectid = ill.hperson
  join #test2 cgdl on ti.roomcode = cgdl.roomcode where start_date between ti.dtmovein and ti.dtmoveout


select *


select * from [TenantInfo] TI
join [ailment] ill
	on TI.prospectid = ill.hperson
join [cgdl_rooms] cgdl
	on cgdl.room = ti.room where  ti.ROOM not like '%[^0-9]%'