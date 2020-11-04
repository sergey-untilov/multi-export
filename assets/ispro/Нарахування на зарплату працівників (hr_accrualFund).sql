-- ����� ���������� ���������� �� �������� (hr_accrualFund)
declare @sysste_rcd bigint = (select max(sysste_rcd) from sysste where sysste_cd = /*SYSSTE_CD*/)
declare @dateFrom date = dateadd(month, -3,(select cast(cast((year(getdate()) - 1) * 10000 + 101 as varchar(10)) as date)))
declare @currentPeriod date = (
	select CASE WHEN LEN (RTRIM(CrtParm_Val)) = 8 THEN CONVERT(DATE, CrtParm_Val, 3) ELSE	CONVERT(DATE, CrtParm_Val, 103) END
	from vwCrtParm 
	where crtParm_cdBpr = 2
	and crtParm_id = 'Period_DatOpen'
	and (@sysste_rcd is null or CrtFrm_Rcd = @sysste_rcd)
)
/*BEGIN-OF-HEAD*/
select
	'ID' ID
	,'periodCalc' periodCalc
	,'periodSalary' periodSalary
	,'tabNum' tabNum
	,'employeeNumberID' employeeNumberID
	,'payFundID' payFundID
	,'sourceSum' sourceSum
	,'baseSum' baseSum
	,'rate' rate
	,'paySum' paySum
	,'addMinSum' addMinSum
union all	
/*END-OF-HEAD*/
select
	cast(min(kpufa1.bookmark) as varchar) ID	
	,cast(cast(kpuf_datup as date) as varchar) periodCalc	
	,cast(cast(kpuf_datrp as date) as varchar) periodSalary	
	,cast(kpuf_tn as varchar) tabNum
	,cast(x1.kpu_rcd as varchar) employeeNumberID	
	,cast(kpuf_cdfnd as varchar) payFundID	
	,cast(sum(kpuf_smsrc) as varchar) sourceSum	
	-- 04-11-2020,cast(sum(case when (kpuf_prz & 128) = 0 then kpuf_smclc else 0 end) as varchar) baseSum
	,cast(sum(kpuf_smclc) as varchar) baseSum -- 04-11-2020
	,cast(kpuf_prc as varchar) rate	
	,cast(sum(kpuf_sm) as varchar) paySum	
	,cast(sum(case when (kpuf_prz & 128) <> 0 then kpuf_smclc else 0 end) as varchar) addMinSum
from kpufa1
inner join kpux x1 on x1.kpu_tn = kpufa1.kpuf_tn
inner join kpuc1 c1 on c1.kpu_rcd = x1.kpu_rcd
where kpuf_cdfnd <> 0
	and kpuf_datup between @dateFrom and (dateAdd(day, -1, @currentPeriod))
	and (@sysste_rcd is null or c1.kpuc_se = @sysste_rcd)
group by kpuf_datup, kpuf_datrp, kpuf_tn, x1.kpu_rcd, kpuf_cdfnd, kpuf_prc
