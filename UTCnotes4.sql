select 
	t.HMYPERSON
	,t.SLASTNAME
	,t.SFIRSTNAME
	,datediff(day,t.dtmovein,dtmoveout) as days_stayed
	,--si.sIncidentTitle
	case
		when si.sIncidentTitle like '%death%' then si.sIncidentTitle
	end as Deaths,
	case
		when si.sIncidentTitle like '%Fall%' then si.sIncidentTitle
	end as Falls,
	case
		when si.sIncidentTitle like '%Behavior%' then si.sIncidentTitle
	end as beheavior,
	 si.sIncidentTitle
	,si.dtReported 
	,case
		when sIncidentTitle like '%death%' then (count(si.sIncidentTitle) over (partition by si.sIncidentTitle))
	end as DeathCount
	,case
		when sIncidentTitle like '%fall%' then (count(si.sIncidentTitle) over (partition by si.sIncidentTitle))
	end as FallCount,
	case
		when sIncidentTitle like '%Behavior%' then (count(si.sIncidentTitle) over (partition by si.sIncidentTitle))
	end as BehaviorCount
	--,count((select sIncidentTitle from SeniorIncident where sIncidentTitle like '%death%'))  over (partition by t.HMYPERSON) as DeathCount
	,count(si.sIncidentTitle) over (partition by t.HMYPERSON) as TotalIncCount
	from TENANT t
join SeniorIncident si
	on si.hAffectedPerson = t.HMYPERSON
where datediff(day,t.dtmovein,dtmoveout) < 90
order by TotalIncCount desc
--select sIncidentTitle from SeniorIncident where sIncidentTitle like '%death%'