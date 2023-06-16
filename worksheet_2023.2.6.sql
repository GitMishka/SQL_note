 

 select max(hmy), dtBillingEnd,bOnNotice,dtnotice from SeniorResidentHistoryStatus where hresident in (130937) group by  dtBillingEnd,bOnNotice,dtnotice

 SELECT      COLUMN_NAME AS 'ColumnName'
            ,TABLE_NAME AS  'TableName'
FROM        INFORMATION_SCHEMA.COLUMNS
WHERE       COLUMN_NAME LIKE '%ireason%'
ORDER BY    TableName
            ,ColumnName;


			select * from SeniorBIProspectMarketing where moveoutdate > '2023-01-01'
			select * from SeniorBIClinicalCensus where financialmoveoutdate > getdate()
			select * from SeniorBIClinicalCensus where billingenddate > getdate()
			select * from SeniorBIClinicalCensus where moveoutdate > getdate()
			select * from tenant where dtmoveout > getdate()
			select max(moveoutdate),max(dtmoveinfinancial) from SeniorBIClinicalCensus
			select max(financialmoveoutdate) from SeniorBIClinicalCensus

			select * from SeniorBIClinicalCensus where residentid = 124483
			select * from SeniorBIClinicalCensus where residentid = 130937
			select * from SeniorBIProspectDetail where residentid = 130937
			select * from tenant where SLASTNAME = 'Johnson' and SFIRSTNAME ='Patricia'
			select * from tenant where HMYPERSON in ( 36867,147705, 129480)
			select * from property where hmy = 151
			select ResidentBillingEndDate, * from SeniorResident where ResidentBillingEndDate > getdate()
			select * from SeniorResidentHistoryStatus where hresident = 130937
			select * from SeniorResidentState where residentid = 130937
			select * from BulkNoticeBatchDet
			select * from SeniorResidentStatus
select * from SeniorResidentHistoryStatus order by dtmoveout desc
select max(dtBillingEnd) from SeniorResidentHistoryStatus
select * from information_schema.columns where column_name like '%moveout%' order by table_name asc
select * from property
select * from SeniorResidentStatus where iStatus NOT IN (2,8,6,7,9,1)
select * from seniorresident where residentid = 130937
select dtBillingEnd,bOnNotice, * from SeniorResidentHistoryStatus where hresident in (144600) --(130937,124483,137788)
select bOnNotice,dtnotice, iMoveOutReason,iStatuscode,* from SeniorResidentHistoryStatus where hresident = 130937
select max(hmy) from SeniorResidentHistoryStatus where hresident = 00010503
select * from tenant where slastname = 'Cephus' and sfirstname = 'Eloise'
select * from tenant where slastname = 'Sliger' and sfirstname = 'Randall'
select * from SeniorResidentHistoryStatus where hresident = 134763

select * from SeniorResidentHistoryStatus 
select istatus, ireason, * from tenant where hmyperson = 130937
select istatus, ireason, * from tenant where hmyperson = 124483
select sfirstname, slastname, dtmovein,dtmoveout,dtnotice from tenant where hmyperson = 130937

select * from SeniorReserveUnit where htenant = 130937
select SDateOccurred,* from Trans where hperson = 130937
select * from ServiceInstance where residentid = 130937
select max(SDateOccurred) from Trans where hperson = 134763
select * from Trans where hperson = 134763 order by SDATEOCCURRED desc
select * from SeniorResidentHistoryStatus where hresident = 130937
select * from SeniorResidentHistoryStatus where hresident = 124483

select * from seniorresident where residentid = 130937
select * from [dbo].[ListOption] where listoptionname like '%quick%'
select * from [dbo].[TRANS] where hperson = 130937
select * from [dbo].[GLDETAIL] where hperson = 130937
select max(dtpost),max(dtdate) from [dbo].[GLDETAIL] where hperson = 124483
select * from [dbo].[GLDETAIL] where hperson = 124483
select * from Trans where hperson = 130937

SELECT      COLUMN_NAME AS 'ColumnName'
            ,TABLE_NAME AS  'TableName'
FROM        INFORMATION_SCHEMA.COLUMNS
WHERE       COLUMN_NAME LIKE '%BillingEnd%'
ORDER BY    TableName
            ,ColumnName;

select * from SeniorResident where residentid = 130937
select dtbillingend, * from SeniorResidentHistoryStatus where dtbillingend > getdate() -- most results
select t.DTMOVEOUT,ResidentBillingEndDate, * from SeniorResident sr 
join tenant t on sr.residentid = t.HMYPERSON
where ResidentBillingEndDate > getdate() and ResidentBillingEndDate > t.DTMOVEOUT

select * from tenant where HMYPERSON = 144600

  declare
 @type varchar,
 @sdat1 date,
 @sdat2 date,
 @PropertyCode varchar,
 @carelev varchar,
 @ContTyp  varchar,
 @SecResident varchar


 set @type = 'MoveOut'
 set @sdat1 = '2022-03-22 00:00:00.000'
 set @sdat2 = '2023-01-25 00:00:00.000'
 set @PropertyCode = 'all'
 set @carelev =''
 set @ContTyp =''
 set @SecResident = 'No'


 CREATE TABLE #SchedTenant(  
      hmy NUMERIC,  
      hmyperson NUMERIC  
     )  
   /* Code will list residents for MoveIn OR MoveOut,  
    Code optimizes reads as selective residents are passed to detail query*/  
   INSERT INTO #SchedTenant  
    SELECT p.hmy ,T.hmyperson  
    FROM dbo.Senior_ListHandler(@PropertyCode, 'sCode') x      
     INNER JOIN Property p ON LTRIM(RTRIM(x.sCode)) = LTRIM(RTRIM(p.sCode))   
     INNER JOIN ListProp2 l ON l.hProplist = p.hmy AND l.iType <> 11   
     INNER JOIN tenant t ON t.hproperty = p.hmy  
    WHERE CASE WHEN @type ='MoveOut' THEN t.dtmoveout   
          WHEN @type ='MoveIn' THEN t.dtmovein END   
      BETWEEN  @sDat1 AND  @sDat2  
    AND 1 = CASE WHEN @type ='MoveOut' AND t.iStatus NOT IN (2,8,6,7,9,1) THEN 1  
        WHEN @type ='MoveIn' AND t.istatus IN (8,2) THEN 1  
      ELSE 0 END

	 


	  SELECT DISTINCT  
     p.hmy pHMY,      
     LTRIM(RTRIM(p.saddr1))+ ' ('+LTRIM(RTRIM(p.scode))+')' propname ,  
     LTRIM(RTRIM(t.sLastName))+', '+LTRIM(RTRIM(t.sFirstName)) +' ('+ LTRIM(RTRIM(t.scode)) + ')' sResidentName ,  
     t.istatus,  
     t.hmyperson ThMy,  
     t.dtmovein moveindate,  
     t.dtnotice Noticedate,   
     t.dtmoveout moveoutdate,   
     u.hmy uhmy,  
     u.scode,  
     ut.scode,  
     ut.SDESC,  
     sr.PrivacyLevelCode privacylevel,   
     sr.CareLevelcode carelevel,   
     t.ireason  Moveoutreason,  
     ISNULL(sr.residentBillingEndDate,'01/01/1900')BillingEndDate,  
     sr.ContractTypeCode ContTyp  
    FROM #SchedTenant ten  
     INNER JOIN tenant t ON t.hmyperson = ten.hmyperson  
     INNER JOIN Property p on p.hmy =t.HPROPERTY  
     INNER JOIN seniorresident sr ON t.hmyperson = sr.residentid   
     INNER JOIN unit u ON u.hmy = t.hunit  
     INNER JOIN unittype ut ON ut.hmy = u.hunittype  
     INNER JOIN Senior_ListHandler(@carelev,'') CrHnd ON CrHnd.scode=sr.CareLevelcode  
     INNER JOIN Senior_ListHandler(@ContTyp,'') ConHnd ON ConHnd.scode = sr.ContractTypeCode  
    WHERE sr.PrivacyLevelCode NOT IN ( SELECT CASE WHEN @SecResident = 'No' THEN secondaryprivacylevel ELSE '' END FROM SeniorPrivacyLevelMapping)  


	 drop table #SchedTenant



select distinct(MeasureDisplayName) from SeniorBICustom_IHPSalesScores
select * from SeniorProspectActivity

CREATE VIEW BI as
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE '%Activ%'

select * from bi where table_name like '%sales%'

	 select top 1 dtin from auditlogin order by dtin desc

select top 1 dtin from auditlogin order by dtin desc

select * from tenant

select DTLEASETO, * from tenant where DTLEASETO < getdate() order by 1 desc
select max(dtnotice) from tenant
select * from SeniorResidentHistoryStatus order by dtBillingEnd desc
select max(dtBillingEnd) max_billingend ,max(dtmoveout) max_moveout from SeniorResidentHistoryStatus
select distinct(dtBillingEnd) from  SeniorResidentHistoryStatus order by 1 desc
select max(dtBillingEnd) from  SeniorResidentHistoryStatus 