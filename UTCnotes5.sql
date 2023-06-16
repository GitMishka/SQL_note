select datediff(day, t.DTMOVEIN, t.DTMOVEOUT) as DaysStayed, * from tenant t
join SeniorIncidentHistory shi 
	on hmy
where datediff(day, t.DTMOVEIN, t.DTMOVEOUT) < 90
select * from SeniorIncidentHistory

select SUBSTRING(sIncidentTitle,1,charindex( ' ',sIncidentTitle,1)- 1) from SeniorIncidentHistory;
SELECT SUBSTRING(LTRIM(sIncidentTitle),2,(CHARINDEX(' ',LTRIM(sIncidentTitle) + ' '))-1) from SeniorIncidentHistory
select * from SeniorIncidentAudit
SELECT RTRIM(SUBSTRING(LTRIM(sIncidentTitle),1,(CHARINDEX(' ',LTRIM(sIncidentTitle) + ' ')-1)))
from SeniorIncidentHistory

select sIncidentTitle from SeniorIncidentHistory

select sIncidentTitle,
    CHARINDEX(' ', sIncidentTitle),
    CASE WHEN CHARINDEX(' ', sIncidentTitle) > 0 THEN
        TRIM(',' from(LEFT(sIncidentTitle,CHARINDEX(' ',sIncidentTitle)-1)))
    ELSE
        sIncidentTitle
    END as FIRST_NAME,
    CASE WHEN CHARINDEX(' ', sIncidentTitle) > 0 THEN
        SUBSTRING(sIncidentTitle,CHARINDEX(' ',sIncidentTitle)+1, ( LEN(sIncidentTitle) - CHARINDEX(' ',sIncidentTitle)+1))
    ELSE
        NULL
    END as LAST_NAME from SeniorIncidentHistory

select * from seniorincidenttypelocationtreatment
--------------------------
SELECT 
	p.sCode PropertyCode,
	si.hmy as IncidentHmy,
	ISNULL(Sih.sIncidentTitle,'') IncidentTitle,
	ISNULL(L.ListOptionName,'') Category,
	ISNULL(Lo.ListOptionName,'') SubCategory,
	ISNULL(LO1.ListOptionName,'') Status,
	ISNULL(Sih.sIncidentNote,'') IncidentNote,
	case when sih.sIncidentStatus='PAP' THEN LTRIM(RTRIM(isnull(r.sdesc,''))) Else '' END empname,
	convert(datetime,cast(dtHistoryStart as varchar(11)),101) DateModified,
	Isnull(u.scode,'DBO') ModifiedBy
from property p 
Inner Join SeniorIncident SI         on   SI.hProperty   = p.hmy  
Inner Join SeniorIncidentHistory Sih on   Sih.hIncident  = SI.Hmy 
Left Join ListOption  L              on   L.Listoptioncode   = Sih.sCategory and l.listname ='IncidentCategory'
Left Join ListOption  Lo             on   Lo.Listoptioncode  = Sih.sSubCategory  and Lo.listname ='IncidentSubCategory'
Left Join ListOption  Lo1            on   Lo1.ListOPtionCode = Sih.sIncidentStatus and LO1.listname = 'IncidentStatus'
Left Join PmUser u                   on   u.hmy   = Sih.hUserModifiedBy
left join SeniorIncidentWorkflowConfiguration config on config.hmy = si.htemplate
LEFT JOIN Role r ON r.Hmy = config.hUserRole

--------------
select * from person
-------------
SELECT distinct
	si.hmy IncidentHmy,
	p.sCode                   PropertyCode,
	L.ListOptionName          IncidentType,  
	case when Tlt.sSectionCode = 'LOC' then 'Location'
	      End TypeLocation,
	case when Tlt.sSectionCode = 'LOC' THEN Lo.ListOptionName + CASE WHEN ISNULL(TltH.dtHistoryEnd,'01/01/1900')= '01/01/1900' THEN ' added' ELSE ' added/removed' END
		
		END  Incident,
	Case 
        when SI.sIncidentCategory In ('RES','STF')  then ISnull(Per.uLastName,'') + ', ' + ISnull(Per.SFIRSTNAME,'') + ' (' + ISnull(Per.uCode,'') + ')'
        when SI.sIncidentCategory = 'OTH'            then isnull(Sic.sName,'')
        else ' '      end    AffectedParty,	
	TltH.dtHistoryStart           DateCreated,
	TltH.dtHistoryEnd            DateModified,
	Isnull(u.scode,'DBO')       ModifiedBy
from       property p 
Inner Join SeniorIncident SI   on SI.hProperty = p.hmy 
Left Join  ListOption L        on L.ListOptionCode = SI.sIncidentCategory and ListName = 'IncidentDetail'
LEFT JOIN  Person   Per                      ON SI.hAffectedPerson = Per.hmy and SI.sIncidentCategory In ('RES','STF') 
LEFT JOIN  SeniorIncidentContact Sic         ON SI.hAffectedPerson = Sic.Hmy and SI.sIncidentCategory = 'OTH'    
Inner Join SeniorIncidentTypeLocationTreatment Tlt on Tlt.hincident = SI.Hmy /*And Tlt.bActive=1*/
Inner Join SeniorIncidentTypeLocationTreatmentHistory  TltH on TltH.hIncident = Tlt.hIncident and TltH.sSectionCode = Tlt.sSectionCode and TltH.sListValue = Tlt.sListValue /*and (TltH.dtHistoryEnd is not null )*/
Left Join PmUser u                     on u.hmy = TltH.hUserModifiedBy 
LEFT JOIN Listoption lo on lo.ListoptionCode = Tlt.sListvalue and lo.listname = 
		case when si.sIncidentCategory='FAC' then 'IncidentLocationFacility' else 'IncidentLocation' end 
Where 1=1
AND Tlt.sSectionCode IN ('LOC')

SELECT 
	p.sCode PropertyCode,
	L.ListOptionName  IncidentType ,
	LO.ListOptionName  Action,
	SiatH.sActionTakenNote ActionTakenNote,
	    Case
        when SI.sIncidentCategory In ('RES','STF')   then ISnull(Per.uLastName,'') + ', ' + ISnull(Per.SFIRSTNAME,'') + ' (' + ISnull(Per.uCode,'') + ')'
        when SI.sIncidentCategory  = 'OTH'           then isnull(Sic.sName,'')
        else '' end                                           AffectedParty, 
	dbo.SeniorCarefnConvertSystemToLocalTime(po.sValue ,SiatH.dthistorystart) DateCreated,
	dbo.SeniorCarefnConvertSystemToLocalTime(po.sValue ,SiatH.dthistoryend)   DateModified,
	Isnull(u.uname,'DBO')  ModifiedBy
from property   p 
Inner Join SeniorIncident SI                       on SI.hProperty = p.hmy 
Left Join  ListOption L                      on L.ListOptionCode = SI.sIncidentCategory and ListName = 'IncidentDetail'
LEFT JOIN  Person   Per                      ON SI.hAffectedPerson = Per.hmy and SI.sIncidentCategory In ('RES','STF') 
LEFT JOIN  SeniorIncidentContact Sic         ON SI.hAffectedPerson = Sic.Hmy and SI.sIncidentCategory = 'OTH' 
Inner Join SeniorIncidentActionTaken Siat          on Siat.hincident = SI.Hmy 
Inner Join SeniorIncidentActionTakenHistory SiatH  on Siat.hmy = SiatH.hActionTaken
Inner Join SeniorIncidentActionTakenDetail  SiatD  on Siat.Hmy = Siatd.hActionTaken
Inner Join ListOption LO on LO.ListOptionCode = SiatD.SListValue 
and LO.ListName = CASE WHEN si.sIncidentCategory ='STF' THEN 'IncidentActionTakenStaff'
									     WHEN si.sIncidentCategory ='RES' THEN 'IncidentActionTakenResident'
									     WHEN si.sIncidentCategory ='OTH' THEN 'IncidentActionTakenOther'
									     WHEN si.sIncidentCategory ='FAC' THEN 'IncidentActionTakenFacility'
									END
Left Join  PmUser u      on u.hmy = SiatH.hUserModifiedBy 
LEFT JOIN PropOptions po ON hProp =si.hProperty AND sType = 'SeniorTimeOffset'
	Where 1=1
-----------------------

SELECT distinct I.Hmy CTRLNo,iat.hmy ActionTakenHmy,
       CASE i.sIncidentCategory
              WHEN 'RES' THEN 'Resident'
              WHEN 'FAC'  THEN 'Facility'
              WHEN 'STF' THEN 'Staff'
              WHEN 'OTH' THEN 'Other'
       END type ,iat.sActionTakenNote,iat.dtComplete DateActionTaken,
	reverse(substring(reverse(replace(ltrim(dbo.SeniorIncidentActionTakenDetails(iat.hmy,i.hmy)),'</br>',',')),3,len(dbo.SeniorIncidentActionTakenDetails(iat.hmy,i.hmy)))) ActionTaken,
	   cast(bNoImmediateActionTaken as numeric(18,0)) as bNoImmediateActionTaken
FROM   SeniorIncident I
       INNER JOIN Property P              ON  p.Hmy = I.hProperty
       left JOIN SeniorIncidentActiontaken Iat ON Iat.hincident = I.Hmy and Iat.bActive = 1 
       LEFT Join SeniorIncidentActiontakendetail Iatd  ON  Iat.Hmy = Iatd.hActionTaken  
       LEFT JOIN ListOption LO3 ON LO3.ListOptionCode = Iatd.sListValue 
	AND  Lo3.ListName = Case i.sIncidentCategory 
				when 'RES' then 'IncidentActionTakenResident'
				 when 'OTH' then 'IncidentActionTakenOther'
				 when 'FAC' then 'IncidentActionTakenFacility'
				 when 'STF' then 'IncidentActionTakenStaff'
		END
where 1=1

------------------------
SELECT I.Hmy CTRLNo,
    	LO7.listoptionname Type ,
	            	LO6.listoptionname    Area                          ,
	            	sn.sSectionNote Concerns ,
	            cast(i.bNoInjuryConcern as numeric(18,0)) bNoInjuryConcern, 
	            '1Wound' OrderBy
FROM   SeniorIncident I
       INNER JOIN Property P                 ON  p.hmy       = I.hProperty
 	     LEFt Join SeniorWound W        ON W.hRecord = I.Hmy
 	     LEFt Join SeniorWoundLocations WL        ON WL.hWound = W.hWoundId
       LEFT JOIN ListOption LO6                 ON LO6.ListOptionCode = WL.sLocationCode AND Lo6.ListName='BodyChartLocation' 
       LEFT JOIN ListOption LO7                 ON LO7.ListOptionCode    = W.sIssueType AND Lo7.ListName='IncidentInjuryType' 
     	 LEFT JOIN SeniorIncidentNotes sn on sn.hIncident = i.hmy and sn.sSectionCode = 'INJ'
WHERE  1=1
	--#Condition1#
 --	#Condition4#   
UNION ALL
SELECT I.Hmy CTRLNo,
    	LO7.listoptionname Type ,
	            	LO6.listoptionname    Area                          ,
	            	sn.sSectionNote Concerns ,
	            cast(i.bNoInjuryConcern as numeric(18,0)) bNoInjuryConcern, 
	            '2Injury' OrderBy
FROM   SeniorIncident I
       INNER JOIN Property P                 ON  p.hmy       = I.hProperty
 	     LEFt Join SeniorIncidentInjury II        ON II.hIncident = I.Hmy and II.bActive= 1 
       LEFT JOIN ListOption LO6                 ON LO6.ListOptionCode = II.sInjuryLocation AND Lo6.ListName='IncidentInjuryArea' 
       LEFT JOIN ListOption LO7                 ON LO7.ListOptionCode    = II.sInjuryType AND Lo7.ListName='IncidentInjuryType' 
     	 LEFT JOIN SeniorIncidentNotes sn on sn.hIncident = i.hmy and sn.sSectionCode = 'INJ'
WHERE  1=1
	--#Condition1#
 --	#Condition4#   
Order By OrderBy 	
--------------------------
SELECT 
         p.sAddr1+' ('+ Ltrim(Rtrim(P.scode)) +')' PropCode
        ,case when I.sReportedByType='RES' or I.sReportedByType='STF' then pr.ulastname +', ' + pr.sfirstname + ' (' + LTRIM(RTRIM(pr.ucode)) + ')'
 				      when I.sReportedByType='OTH' then sic.sname 
		   	      When I.sReportedByType ='REC' then sc.contactlastname + ', ' + sc.contactFirstname end ReportedByName
       , Lo.ListoptionName AS GeneralCategory
       , Lo1.ListoptionName AS RiskCategory
       , Lo2.ListoptionName AS Status
       , I.Hmy "CTRLNo"
       , I.dtIncidentDate "dtIncident"
       , I.dtReported "dtReported"
       , case when I.sReportedByType='RES' or I.sReportedByType='STF' then pr.ulastname +', ' + pr.sfirstname
		  				when I.sReportedByType='OTH' then sic.sname 
						  When I.sReportedByType ='REC' then sc.contactlastname + ', ' + sc.contactFirstname end "ReportedByLookupType"
       , case when i.sIncidentStatus ='PAP' then r.sdesc 
       	 when i.sIncidentStatus ='CLS' 
       	then case when isnull(i.hApprovedBy,0) = 0 then 'DBO' else 
       	/*u1.uname */
       	CASE ISNULL(pe1.uLASTNAME,'') + CASE ISNULL(pe1.sFirstName,'') WHEN '' THEN '' ELSE ', ' + ISNULL(pe1.sFirstName,'') END WHEN ', ' THEN ISNULL(u1.uName,'') ELSE ISNULL(pe1.uLASTNAME,'') + CASE ISNULL(pe1.sFirstName,'') WHEN '' THEN '' ELSE ', ' + ISNULL(pe1.sFirstName,'') END END
       	end  else case when i.hUserCreatedBy =0 then 'DBO' else 
       	/*u.uname */
       	CASE ISNULL(pe.uLASTNAME,'') + CASE ISNULL(pe.sFirstName,'') WHEN '' THEN '' ELSE ', ' + ISNULL(pe.sFirstName,'') END WHEN ', ' THEN ISNULL(u.uName,'') ELSE ISNULL(pe.uLASTNAME,'') + CASE ISNULL(pe.sFirstName,'') WHEN '' THEN '' ELSE ', ' + ISNULL(pe.sFirstName,'') END END
       	end end "AssignedToCode"
       , I.sIncidentTitle "sShortTitle"
       , I.bActive "RetireRec"
       ,  '' "Reason"
       , I.sIncidentNote "IncidentDesc" 
   	   ,LO3.ListOptionName IncidentCategory  
   	    ,  Case 
         when I.sIncidentCategory In ('RES','STF')  then  ISnull(Per.uLastNAME,'') +  ', ' + ISnull(Per.SFIRSTNAME,'') 
         when I.sIncidentCategory = 'OTH'           then isnull(Sic1.sName,'')
         else '' end                                           AffectedParty,
            l1.listoptionname      IncidentType   ,
          (select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Description' ) DescriptionTabDisplay,
				  (select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Location' ) LocationTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Injury / Concerns' ) InjuryTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Treatment' ) TreatmentTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Witness' ) WitnessTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Immediate Action Taken' ) ImmediateActionTakenTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Notification Log' ) NotificationLogTabDisplay,
					case when i.sIncidentCategory <> 'RES' then 'No' else (select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Vital Signs' ) end VitalSignsTabDisplay,
					(select case when bDisplay =1 then 'Yes' else 'No' END Display from SeniorIncidentWorkflowConfigurationdetail where hIncidentConfig=i.hTemplate and sname ='Action Plan' ) ActionPlanTabDisplay
FROM   SeniorIncident  I
	     Inner Join Property P     ON p.hmy = I.hProperty	
	     Left JOIN ListOption LO   ON LO.ListOptionCode  = I.sCategory AND  Lo.ListName='IncidentCategory'
	     Left JOIN ListOption LO1  ON LO1.ListOptionCode = I.sSubCategory AND  Lo1.ListName='IncidentSubCategory' 
	     Left JOIN ListOption LO2  ON LO2.ListOptionCode = I.sIncidentStatus AND  Lo2.ListName='IncidentStatus' 
	     LEFT JOIN  Tenant    T                  ON T.hMyperson        = I.hReportedBy AND I.sReportedByType ='RES'
	     LEFT JOIN seniorresidentstatus srs ON srs.Istatus = t.istatus 
       LEFT JOIN  Person   Pr                 ON I.hReportedBy = pr.hmy and I.sReportedByType In ('RES','STF') 
       LEFT JOIN  SeniorIncidentContact Sic    ON I.hReportedBy = Sic.Hmy and I.sReportedByType = 'OTH'
   		 left JOIN SeniorContact sc on sc.contactid = i.hReportedBy and i.sReportedByType ='REC'
   		 LEFT JOIN  ListOption LO3                ON LO3.ListoptionCode  = I.sIncidentCategory  AND LO3.ListName='IncidentDetail'
   		 LEFT JOIN  Person   Per                 ON I.hAffectedPerson = Per.hmy and I.sIncidentCategory In ('RES','STF') 
       LEFT JOIN  SeniorIncidentContact Sic1    ON I.hAffectedPerson = Sic1.Hmy and I.sIncidentCategory = 'OTH'   
       LEFT JOIN pmuser u on u.hmy = i.hUserCreatedBy
       left join pmuser u1 on u1.hmy = i.hApprovedBy
	   LEFT JOIN PREMPLOYEE em ON u.HMY = em.hUser
	   LEFT JOIN Person pe ON em.HMYPERSON = pe.hMy
	   LEFT JOIN PREMPLOYEE em1 ON u1.HMY = em1.hUser
	   LEFT JOIN Person pe1 ON em1.HMYPERSON = pe1.hMy
       LEFT JOIN SeniorIncidentWorkflowConfiguration wk on wk.hmy = i.htemplate
       left join role r on r.hmy = wk.hUserRole
       LEFT JOIN Listoption l1 on l1.listoptioncode =i.sIncidentType 
      AND l1.ListName = case when i.sIncidentCategory = 'RES' then 'IncidentTypeResident'
			when i.sIncidentCategory  ='FAC' then 'IncidentTypeFacility'
			when  i.sIncidentCategory  ='STF' then 'IncidentTypeStaff'
			when  i.sIncidentCategory  ='OTH' then 'IncidentTypeOther' END
----------------------
SELECT	I.Hmy CtrlNo
	,I.dtCreated dtCreated
	,Lo.ListoptionName DetailType
	,CASE 
		WHEN I.sIncidentCategory IN (
				'RES'
				,'STF'
				)
			THEN ISnull(Per.uLastNAME, '') + ', ' + ISnull(Per.SFIRSTNAME, '')
		WHEN I.sIncidentCategory = 'OTH'
			THEN isnull(Sic.sName, '')
		ELSE ''
		END AffectedParty
	,CASE 
		WHEN isnull(TLT.hmy, 0) <> 0
			THEN CASE 
					WHEN TLT.sSectionCode = 'LOC'
						THEN 'Location:'
					END
		END SectionName
	,CASE 
		WHEN isnull(TLT.hmy, 0) <> 0
			THEN CASE 
					WHEN TLT.sSectionCode = 'LOC'
						THEN 'Location:'
					END
		END ListName
	,l.listoptionname Listname1
	,notes.sSectionNote notes
	,'Location'
FROM SeniorIncident I
INNER JOIN Property P ON p.hmy = I.hProperty
LEFT JOIN ListOption LO ON LO.ListoptionCode = I.sIncidentCategory
	AND Lo.ListName = 'IncidentDetail'
LEFT JOIN Tenant T ON T.hMyperson = I.hAffectedPerson
	AND I.sIncidentCategory = 'RES'
LEFT JOIN seniorresidentstatus srs ON srs.Istatus = t.istatus 
LEFT JOIN Person Per ON I.hAffectedPerson = Per.hmy
	AND I.sIncidentCategory IN (
		'RES'
		,'STF'
		)
LEFT JOIN SeniorIncidentContact Sic ON I.hAffectedPerson = Sic.Hmy
	AND I.sIncidentCategory = 'OTH'
LEFT JOIN SeniorIncidentTypeLocationTreatment TLT ON TLT.hincident = I.hmy
	AND TLT.BaCTIVE = 1
LEFT JOIN Listoption l ON l.listoptioncode = TLT.sListvalue
	AND l.listname = CASE 
		WHEN TLT.sSectionCode = 'LOC'
			AND i.sIncidentCategory = 'FAC'
			THEN 'IncidentLocationFacility'
		WHEN TLT.sSectionCode = 'LOC'
			AND i.sIncidentCategory <> 'FAC'
			THEN 'IncidentLocation'
		END
LEFT JOIN SeniorIncidentNotes notes ON notes.hIncident = i.hmy
	AND notes.sSectionCode = 'LOC'
WHERE  1 = 1
       and ABS(I.bActive) <> 0	
       and TLT.sSectionCode='LOC' 
       --#Condition1#
       --#Condition2#
       --#Condition3#
       --#Condition4#
ORDER BY 1

--------------
SELECT I.Hmy CtrlNo
	,I.dtCreated dtCreated
	,Lo.ListoptionName DetailType
	,CASE 
		WHEN I.sIncidentCategory IN (
				'RES'
				,'STF'
				)
			THEN ISnull(Per.uLastNAME, '') + ', ' + ISnull(Per.SFIRSTNAME, '')
		WHEN I.sIncidentCategory = 'OTH'
			THEN isnull(Sic.sName, '')
		ELSE ''
		END AffectedParty
	,CASE 
		WHEN isnull(TLT.hmy, 0) <> 0
			THEN CASE 
					WHEN TLT.sSectionCode = 'TRE'
						THEN 'Initial Treatment'
					END
		END SectionName
	,CASE 
		WHEN isnull(TLT.hmy, 0) <> 0
			THEN CASE 
					WHEN TLT.sSectionCode = 'TRE'
						THEN 'Treatment:'
					END
		END ListName
	,l.listoptionname Listname1
	,notes.sSectionNote notes
	,'Treatment'
FROM SeniorIncident I
INNER JOIN Property P ON p.hmy = I.hProperty
LEFT JOIN ListOption LO ON LO.ListoptionCode = I.sIncidentCategory
	AND Lo.ListName = 'IncidentDetail'
LEFT JOIN Tenant T ON T.hMyperson = I.hAffectedPerson
	AND I.sIncidentCategory = 'RES'
LEFT JOIN seniorresidentstatus srs ON srs.Istatus = t.istatus 	
LEFT JOIN Person Per ON I.hAffectedPerson = Per.hmy
	AND I.sIncidentCategory IN (
		'RES'
		,'STF'
		)
LEFT JOIN SeniorIncidentContact Sic ON I.hAffectedPerson = Sic.Hmy
	AND I.sIncidentCategory = 'OTH'
LEFT JOIN SeniorIncidentTypeLocationTreatment TLT ON TLT.hincident = I.hmy
	AND TLT.BaCTIVE = 1
LEFT JOIN Listoption l ON l.listoptioncode = TLT.sListvalue
	AND l.listname = CASE 
		WHEN TLT.sSectionCode = 'TRE'
			THEN 'IncidentInitTreatment'
		END
LEFT JOIN SeniorIncidentNotes notes ON notes.hIncident = i.hmy
	AND notes.sSectionCode = 'TRE'
WHERE 1 = 1
	AND ABS(I.bActive) <> 0
	AND TLT.sSectionCode = 'TRE'