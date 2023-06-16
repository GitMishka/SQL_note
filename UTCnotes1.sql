/****** Script for SelectTopNRows command from SSMS  ******/


select * from (

SELECT [Unit]
      ,[property]
      ,[hperson]
   --  ,[StartDate]
      ,[hmy]
      ,[Clinicalname]
      ,[Medical_Type]
  FROM [CGDL].[dbo].[Medical_Yardi] ) as a
  pivot 
  (max([Clinicalname])
  for [Medical_Type] in ([Allergy],[Disease],[Diet])
  ) as b
 

 SELECT  distinct([Medical_Type])
  FROM [CGDL].[dbo].[Medical_Yardi]

  SELECT 
      max([Clinicalname])
      ,[Medical_Type]
  FROM [CGDL].[dbo].[Medical_Yardi]
  group by  
      
      Medical_Type