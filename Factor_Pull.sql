--- Factor raw ratio & ranking
select top 5 * from backend.vradata.[dbo].[ModelFactorRawRank_US]

select top 5 * from backend.vradata.[dbo].[ModelFactorRawRank_global] 

-------frontend
select dbname from equityresearch.dbo.universe
where universeid in (615,617)    --------used to find dbname

 

select top 5 * from vradata02.[dbo].[ModelFactorRank]   ---db name should be the one from the above query 

--- Universe
select top 5 * from vra.dbo.universesecurity

select top 5 * from backend.vra.dbo.universesecurity

select top 100 * 
from EquityResearch.[dbo].[Factors]
where FactorName like '%book-%'


--- Find the last day of each month
--drop table #temp_lastd
select y = DATEPART(yyyy,Date), m = DATEPART(mm,Date), lastD = max(Date)
--into #temp_lastd
--select top 5 * 
from backend.vradata.[dbo].[ModelFactorRawRank_US]
where 1=1
and FactorId = 29
and Date >= '01/01/2019'
group by DATEPART(yyyy,Date), DATEPART(mm,Date)
order by DATEPART(yyyy,Date), DATEPART(mm,Date)

--select * from #temp_lastd

--- select all factors for above dates
select top 100 *
from backend.vradata.[dbo].[ModelFactorRawRank_US]
where 1=1
and FactorId in (29,73,106,146,249,304)
and Date in (select lastD from #temp_lastd)


