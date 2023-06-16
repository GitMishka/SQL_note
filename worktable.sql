Declare    
       @hprop               AS VARCHAR(6000)          
      ,@BOM                 AS DATETIME          
      ,@EOM                 AS DATETIME          
      ,@flag                AS INTEGER          
      ,@ShowSeccondResident CHAR(3)        
   ,@IncludeMoveOutDate  CHAR(3)      
      ,@CareLevel           VARCHAR(1000)      
   ,@AdditionalUnit CHAR(3)         
  DECLARE @BegDefault DATETIME,      
          @EndDefault DATETIME,      
    @BOMActual  DATETIME;      
  SET @BegDefault = '01/01/1900'      
  SET @EndDefault = '12/31/2200'      
  SET @BOMActual  = '07/01/2021'     
  SET @BOM        = DATEADD(dd, -1, @BOMActual)  
  SET @EOM  = DATEADD(Month, 1, @BOMActual)

  SET @IncludeMoveOutDate = 'Yes' 

--  SELECT
--t.HPROPERTY,
--0,
----'',
--srh.dtmoveout,
----su.CareLevelCode,
--0,
--sum(
--CASE WHEN (srh.sPrivacyLevelCode = 'PRI') then 1 WHEN (
--srh.sPrivacyLevelCode IN ('SPA', 'SPB')
--) then 0.50 WHEN (
--srh.sPrivacyLevelCode IN ('TOA', 'TOB', 'TOC')
--) then 0.33 WHEN (
--srh.sPrivacyLevelCode IN ('QDA', 'QDB', 'QDC', 'QDD')
--) then 0.25 else 0 end
--) AS MoveOutCount
--FROM
--SeniorResidentHistoryStatus srh
--JOIN Tenant t ON srh.hresident = t.HMYPERSON
--Join SeniorResidentHistory srh1 on srh1.residentid = t.HMYPERSON
----JOIN SeniorUnit su ON (srh1.UnitId = su.UnitID) -- Use unit Carelevel
--join SeniorRecurringCharge srg on srg.residentid = t.HMYPERSON
----join listoption l on 
--WHERE 1 = 1 and srh.dtmoveout IS NOT NULL
----AND @flag = 4 
--AND ISNULL(srg.Recurringchargetodate, @EndDefault) 
--BETWEEN
--@BOM and @EOM  
------CASE @IncludeMoveOutDate WHEN 'No' 
------	THEN @BOMActual ELSE @BOM 
------	END
------AND 
------CASE @IncludeMoveOutDate WHEN 'No' 
------	THEN @EOM ELSE DATEADD(dd, -1, @EOM) 
------	END

--GROUP BY
--t.hProperty
----,su.CareLevelCode
--,srh.dtmoveout
--order by t.hProperty asc


--/*
--select * from SeniorResidentHistoryStatus
--select * from SeniorUnitHistory
--select * from SeniorResidentHistory
--select * from SeniorRecurringCharge
--select * from listoption
--order by hproperty asc
----distinct(sPrivacyLevelCode)



--SELECT      c.name  AS 'ColumnName'
--            ,t.name AS 'TableName'
--FROM        sys.columns c
--JOIN        sys.tables  t   ON c.object_id = t.object_id
--WHERE       c.name LIKE '%ResidentHistoryCode%'
--ORDER BY    TableName
--            ,ColumnName;
--*/

select 
sum(
CASE WHEN (src.PrivacyLevelCode = 'PRI') then 1 WHEN (
SRC.PrivacyLevelCode IN ('SPA', 'SPB')
) then 0.50 WHEN (
src.PrivacyLevelCode IN ('TOA', 'TOB', 'TOC')
) then 0.33 WHEN (
src.PrivacyLevelCode IN ('QDA', 'QDB', 'QDC', 'QDD')
) then 0.25 else 0 end
) 
AS MoveOutCount

--,hmy
	--,t.scode
	,t.DTMOVEIN
	,t.DTMOVEOUT
	,t.slastname
	,t.sfirstname
	--,shrs.hproperty
	--,ServiceInstanceActiveFlag
	--,iStatusCode
	,Isnull(l3.listoptionname, '*None')	AS Description
 from tenant t
join SeniorRecurringCharge SRC on SRC.ResidentID = t.HMYPERSON
--where src.residentid in ( 88167 , 53918 )
INNER JOIN ServiceInstance si on t.HMYPERSON = si.ResidentID
left join service  s on s.serviceid = si.ServiceID and ServiceClassID = 1 and ServiceInstanceFromDate <= ISNULL(ServiceInstanceToDate,ServiceInstanceFromDate)
join seniorprospect sp on sp.htenant=t.hmyperson
LEFT JOIN seniorprospectsource sps	ON sps.sourceid = sp.hsource
       LEFT JOIN listoption ls	ON ls.listoptioncode = sps.sourcetypecode --AND ls.listoptionname in ('12','14','20','21','25','2','31','5')
       LEFT JOIN listoption l3	ON (convert(varchar(10),t.ireason) = l3.listoptioncode and l3.ListName = 'MoveOutReason')
where t.dtmoveout  between
'2021-06-30 00:00:00.000' and '2021-8-01 00:00:00.000' and t.HPROPERTY =  27    
group by 
	--,t.scode
	--,t.DTMOVEIN
	--,t.DTMOVEOUT
	t.slastname
	,t.sfirstname
	--,shrs.hproperty
	--,ServiceInstanceActiveFlag
	--,iStatusCode
	,Isnull(l3.listoptionname, '*None')	,t.DTMOVEIN
	,t.DTMOVEOUT


--IF OBJECT_ID ('TempDb..#ResidentMoveInOutCount') IS NOT NULL      
--      DROP TABLE #ResidentMoveInOutCount      
--  CREATE TABLE #ResidentMoveInOutCount      
--  (      
--   PropertyId                NUMERIC ,       
--   UnitId                    NUMERIC,      
--   CareLevelCodeIn           VARCHAR(50),      
--   CareLevelCodeOut          VARCHAR(50),      
--   MoveInCount         NUMERIC(18, 2),      
--   MoveOutCount        NUMERIC(18, 2)      
--   )  



--INSERT INTO #ResidentMoveInOutCount (      
--                            PropertyId   ,       
--                            UnitId         ,      
--                            CareLevelCodeIn  ,      
--                            CareLevelCodeOut   ,      
--                            MoveInCount        ,      
--                            MoveOutCount)  	

	SELECT 

	*
--t.HPROPERTY,
--t.DTMOVEOUT,
--0,
--'',
--su.CareLevelCode,
--0,

--CASE WHEN (SRH.PrivacyLevelCode = 'PRI') then 1 WHEN (
--SRH.PrivacyLevelCode IN ('SPA', 'SPB')
--) then 0.50 WHEN (
--SRH.PrivacyLevelCode IN ('TOA', 'TOB', 'TOC')
--) then 0.33 WHEN (
--SRH.PrivacyLevelCode IN ('QDA', 'QDB', 'QDC', 'QDD')
--) then 0.25 else 0 end
--AS MoveOutCount,
--SRH.PrivacyLevelCode
FROM
Tenant T
join SeniorResidentHistory SRH on SRH.ResidentID = t.HMYPERSON
join ServiceInstance SI on SI.ResidentID = t.HMYPERSON
JOIN SeniorUnit su ON (srh.UnitId = su.UnitID) -- Use unit Carelevel
WHERE
t.DTMOVEout is not null and 
1 = 1 AND ISNULL(
si.ServiceInstanceToDate, @EndDefault
) BETWEEN @BOM AND @EOM
and t.HPROPERTY = 27
--and slastname = 'Barnes'
--order by PrivacyLevelCode desc
--CASE @IncludeMoveOutDate
--WHEN 'No' THEN @BOMActual ELSE @BOM END
--AND
--CASE @IncludeMoveOutDate WHEN 'No' THEN @EOM ELSE DATEADD(dd, -1, @EOM) END
--AND ISNULL(t.dtMoveOut, 0) = 1 --AND @flag = 4 
--GROUP BY t.HPROPERTY, su.CareLevelCode

--select * from SeniorResidentHistory

--select distinct(residenthistorycode) from SeniorResidentHistory
--select * from ServiceInstance
--select * from listoption
--where ListName = 'MoveOutReason'
--ResidentHistoryCode in ('AUN', 'MIN', 'QIK','CMO','OUT','CVT') 