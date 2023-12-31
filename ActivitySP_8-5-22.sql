
--ALTER PROCEDURE [dbo].[usp_senior_bi_SeniorBICustom_IHPSalesActivity_query] 
--(@FromDate Date='01/01/2000', @ToDate Date='6/29/2022',@PropertyId numeric(18,0)=NULL) AS  BEGIN -- Leads (40)
declare
@FromDate date= dateadd(mm, datediff(mm, 0, getdate()), 0), --()'01/01/2000',
@ToDate  DATE=dateadd(ms, -3, dateadd(mm, datediff(mm, 0, getdate()) + 1, 0)),-- '6/29/2022',
@PropertyId NUMERIC(18,0)=NULL
print @FromDate
print @ToDate
DROP TABLE IF EXISTS #AllActivity
DROP TABLE IF EXISTS #tempactivity
select 
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, 'lead' as EventType
	, '' as ActivityType
	, sp.ResidentID 
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtDate as [Date]
	, pd.dtStart as PeriodStart
INTO #AllActivity
from 
	Property p
	left join (
	select 
		ph.hProperty
		,sp.hMy as ResidentID
        ,Convert(date, ph.dtDate) as dtDate
		,sp.slastname
		,sp.sfirstname
		,sp.dtFirstContact
	from 
		SeniorProspect sp
		left join 
      (SELECT tbl.*
		FROM SeniorProspectHistory tbl
		  INNER JOIN (
			SELECT hProspect, MIN(hMy) hMy
			FROM SeniorProspectHistory
			group by hProspect
			) tbl1 ON tbl1.hmy = tbl.hmy
			) ph on sp.hMy = ph.hProspect
			where Convert(date, ph.dtDate) between @FromDate and @ToDate
			and sp.sStatus <> 'Referral' and sp.dtFirstContact is not null
			) sp on p.hMy = sp.hProperty
			INNER JOIN SeniorBIPeriodDates pd
on Convert(date, sp.dtDate) between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

-- Tours (50) and Second/Add Tours (58)
UNION ALL
select 
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, CASE WHEN sp.activityname in ('Tour','First Tour', 'Rescheduled Tour', 'First Virtual Tour') Then 'tour'
	  ELSE 'touradd' End as EventType
	, sp.activityname as ActivityType
	, sp.ResidentID
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtCompleted as [Date]
	, pd.dtStart as PeriodStart
from 
	Property p
	left join (
      	select
            p.hMy
            ,sp.hProperty
            ,pa.ActivityCategory
			,pa.activityname
			,Convert(date, ph.dtCompleted) as dtCompleted
			,sp.hMy as ResidentID
			,sp.slastname
			,sp.sfirstname
        from 
            SeniorProspect sp
            left join SeniorProspectHistory ph on sp.hMy = ph.hProspect
            left join SeniorProspectActivity pa on ph.ActivityID = pa.ActivityID
      		left join Property p on p.hmy = ph.hproperty
            where 
				Convert(date, ph.dtCompleted) between @FromDate and @ToDate
				and pa.ActivityCategory = 'TOU'
    ) sp on p.hMy = sp.hMy
INNER JOIN SeniorBIPeriodDates pd
on sp.dtCompleted between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

-- Follow-Up Activity (30)
UNION ALL
select 
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, 'followup' as EventType
	, sp.activityname as ActivityType
	, sp.ResidentID
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtCompleted as [Date]
	, pd.dtStart as PeriodStart
from 
	Property p
	left join (
      	select
			p.hMy
            ,sp.hProperty
            ,Convert(date, ph.dtCompleted) as dtCompleted
		    ,ph.dtDate
            ,pa.ActivityCategory
			,pa.activityname
			,sp.slastname
			,sp.sfirstname
			,sp.hMy as ResidentID
        from 
			SeniorProspect sp
            left join SeniorProspectHistory ph on sp.hMy = ph.hProspect
			left join Property p on p.hmy = ph.hproperty
            left join SeniorProspectActivity pa on ph.ActivityID = pa.ActivityID
            where 
				Convert(date, ph.dtCompleted) between @FromDate and @ToDate
				and pa.ActivityCategory in ('PAP','PEV','PFU','PMA') and activityname in ('Contract Signing','Deposit','Event','Home Visit','Lunch',
				   'Pre Assessment','Walk In','Family Event','Marketing External','Marketing Internal','Call In','Call Out','Email In','Email Out','Event Invite','Thank You Letter')
					and sp.sStatus <> 'Referral'      
            ) sp on p.hMy = sp.hMy
INNER JOIN SeniorBIPeriodDates pd
on sp.dtCompleted between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

-- Completed New Referral F to F Activity (10)
UNION ALL
SELECT
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, 'newref' as EventType
	, sp.activityname as ActivityType
	, sp.ResidentID
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtCompleted as [Date]
	, pd.dtStart as PeriodStart
from 
	Property p
	left join (
 		select 
			p.hMy
			,sp.hProperty
			,pa.ActivityCategory
			,pa.ActivityName
			,Convert(date, ph.dtCompleted) as dtCompleted
			,sp.hMy as ResidentID
			,sp.slastname
			,sp.sfirstname
		from 
			SeniorProspectHistory ph
			left join Property p on p.hmy = ph.hproperty
			left join SeniorProspectActivity pa on ph.ActivityID = pa.ActivityID
			left join SeniorProspect sp on sp.hMy = ph.hProspect
            where 
                Convert(date, ph.dtCompleted) between @FromDate and @ToDate
				and pa.ActivityCategory in ('NRF') and pa.ActivityName  in ('Marketing Visit', 'Call In', 'Call Out', 'External Event', 'Lunch')
    ) sp on p.hMy = sp.hMy
INNER JOIN SeniorBIPeriodDates pd
on sp.dtCompleted between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

-- Completed Existing Referral F to F Activity (20)
UNION ALL
SELECT
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, 'extref' as EventType
	, sp.activityname as ActivityType
	, sp.ResidentID
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtCompleted as [Date]
	, pd.dtStart as PeriodStart
from 
	Property p
	left join (
 		select 
			p.hMy
			,sp.hProperty
			,pa.ActivityCategory
			,pa.ActivityName
			,Convert(date, ph.dtCompleted) as dtCompleted
			,sp.hMy as ResidentID
			,sp.slastname
			,sp.sfirstname
		from 
			SeniorProspectHistory ph
			left join Property p on p.hmy = ph.hproperty
			left join SeniorProspectActivity pa on ph.ActivityID = pa.ActivityID
			left join SeniorProspect sp on sp.hMy = ph.hProspect
            where 
                Convert(date, ph.dtCompleted) between @FromDate and @ToDate
				and pa.ActivityCategory in ('ERA') and pa.ActivityName  in ('Marketing Visit', 'Call In', 'Call Out', 'External Event', 'Lunch')     
   ) sp on p.hMy = sp.hMy
INNER JOIN SeniorBIPeriodDates pd
on sp.dtCompleted between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

-- Completed SalesMail (59)
UNION ALL
SELECT
	p.hMy as PropertyID
	, Ltrim(Rtrim(p.saddr1)) as PropertyName
	, Ltrim(Rtrim(p.scode)) as PropertyCode
	, att.SUBGROUP2 as Region
	, 'salesmail' as EventType
	, sp.activityname as ActivityType
	, sp.ResidentID
	, sp.slastname + ', ' + sp.sfirstname as ResidentName
	, sp.dtCompleted as [Date]
	, pd.dtStart as PeriodStart
from 
	Property p
	left join (
 		select 
			p.hMy
			,sp.hProperty
			,pa.ActivityCategory
			,pa.ActivityName
			,Convert(date, ph.dtCompleted) as dtCompleted
			,sp.hMy as ResidentID
			,sp.slastname
			,sp.sfirstname
		from 
			SeniorProspectHistory ph
			left join Property p on p.hmy = ph.hproperty
			left join SeniorProspectActivity pa on ph.ActivityID = pa.ActivityID
			left join SeniorProspect sp on sp.hMy = ph.hProspect
            where 
                Convert(date, ph.dtCompleted) between @FromDate and @ToDate
                and pa.ActivityName in ('SalesMail')
				and sp.sStatus = 'Referral'      
    ) sp on p.hMy = sp.hMy
INNER JOIN SeniorBIPeriodDates pd
on sp.dtCompleted between pd.dtStart and pd.dtEnd
AND hPeriod in (select hmy from SeniorBIPeriod where sPeriodName = 'IHP Weekly')
LEFT JOIN Attributes att on p.hmy = att.hprop
where p.hMy in (SELECT PropertyId from SeniorBIPropertyDateRange)
AND p.hmy = Isnull(@PropertyId, p.hmy)

select CASE WHEN propertyid = 24 Then 29
            WHEN propertyid = 29 Then 24  
			WHEN propertyid = 31 Then 32
            WHEN propertyid = 32 Then 31 
			WHEN propertyid = 26 Then 27
            WHEN propertyid = 27 Then 26 
			WHEN propertyid = 13 Then 52
            WHEN propertyid = 52 Then 13 
			WHEN propertyid = 79 Then 80
            WHEN propertyid = 80 Then 79 
			WHEN propertyid = 4 Then 5
            WHEN propertyid = 5 Then 4 
			WHEN propertyid = 12 Then 61
            WHEN propertyid = 61 Then 12 
			WHEN propertyid = 63 Then 65
            WHEN propertyid = 65 Then 63  
			WHEN propertyid = 11 Then 76
            WHEN propertyid = 76 Then 11 
			End as propertyid, PropertyName, PropertyCode, Region, EventType, ActivityType, ResidentID, ResidentName, Date, PeriodStart
into #tempactivity
from #AllActivity
where propertyid in (24,29,31,32,26,27,13,52,79,80,4,5,12,61,63,65,11,76)
and eventtype in ('newref', 'extref', 'salesmail')

select eventtype,activitytype, count(eventtype) 
from 
	(
	Select * from #AllActivity
	UNION ALL
	select * from #tempactivity
	)  a
where propertyname = 'Morning Pointe of Russell'
group by eventtype,activitytype


--select activitytype,count(activitytype) 
--from 
--	(
--	Select * from #AllActivity
--	UNION ALL
--	select * from #tempactivity
--	)  a
--where propertyname = 'Morning Pointe of Russell'
--group by activitytype



select * from 
	(
	Select * from #AllActivity
	UNION ALL
	select * from #tempactivity
	) b
where propertyname = 'Morning Pointe of Russell'



--END 