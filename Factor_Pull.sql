--- Factor raw ratio & ranking
select top 5 * from backend.vradata.[dbo].[ModelFactorRawRank_US]

select top 5 * from backend.vradata.[dbo].[ModelFactorRawRank_global] 

-- find out univeser ID
Select * from QUICLYtbl_Universe
Where 1=1
--and Name IN ('UNIVERSE_DEVELOPEDMARKETEXNORTHAM')
and UniverseID = 1290

-------frontend
select dbname from equityresearch.dbo.universe
where universeid in (1292)    --------used to find dbname

 
 ActRtn12M|ActRtn12M|12-Month Active Return with 1-month Lag|
select top 5 * from vradata02.[dbo].[ModelFactorRank]   ---db name should be the one from the above query 

--- Universe
select top 5 * from vra.dbo.universesecurity

select top 5 * from backend.vra.dbo.universesecurity

select top 100 * 
from EquityResearch.[dbo].[Factors]
where 1=1
and FactorName like '%fama%'
--and FactorId in ('481')



--- Find the last day of each month
--drop table #temp_lastd
select y = DATEPART(yyyy,Date), m = DATEPART(mm,Date), lastD = max(Date)
--into #temp_lastd
--select top 5 * 
from backend.vradata.[dbo].[ModelFactorRawRank_US]
where 1=1
and FactorId = 29
and Date >= '01/01/2010'
group by DATEPART(yyyy,Date), DATEPART(mm,Date)
order by DATEPART(yyyy,Date), DATEPART(mm,Date)

--select * from #temp_lastd

--- select all factors for above dates
select top 100 *
from backend.vradata.[dbo].[ModelFactorRawRank_US]
where 1=1
and FactorId in (29,73,106,146,249,304)
and Date in (select lastD from #temp_lastd)


--- Single query to run in PROD
--('2019-01-31 00:00:00','2019-02-28 00:00:00','2019-03-29 00:00:00','2019-04-30 00:00:00','2019-05-31 00:00:00','2019-06-28 00:00:00','2019-07-31 00:00:00','2019-08-30 00:00:00',
--				'2019-09-30 00:00:00','2019-10-31 00:00:00','2019-11-29 00:00:00','2019-12-31 00:00:00','2020-01-31 00:00:00','2020-02-12 00:00:00')
--('01/29/2010','02/26/2010','03/31/2010','04/30/2010','05/31/2010','06/30/2010','07/30/2010','08/31/2010','09/30/2010','10/29/2010','11/30/2010','12/31/2010','01/31/2011','02/28/2011','03/31/2011','04/29/2011','05/31/2011','06/30/2011','07/29/2011','08/31/2011','09/30/2011','10/31/2011','11/30/2011','12/30/2011','01/31/2012','02/29/2012','03/30/2012','04/30/2012','05/31/2012','06/29/2012','07/31/2012','08/31/2012','09/28/2012','10/31/2012','11/30/2012','12/31/2012','01/31/2013','02/28/2013','03/29/2013','04/30/2013','05/31/2013','06/28/2013','07/31/2013','08/30/2013','09/30/2013','10/31/2013','11/29/2013','12/31/2013','01/31/2014','02/28/2014','03/31/2014','04/30/2014','05/30/2014','06/30/2014','07/31/2014','08/29/2014','09/30/2014','10/31/2014','11/28/2014','12/31/2014','01/30/2015','02/27/2015','03/31/2015','04/30/2015','05/29/2015','06/30/2015','07/31/2015','08/31/2015','09/30/2015','10/30/2015','11/30/2015','12/31/2015','01/29/2016','02/29/2016','03/31/2016','04/29/2016','05/31/2016','06/30/2016','07/29/2016','08/31/2016','09/30/2016','10/31/2016','11/30/2016','12/30/2016','01/31/2017','02/28/2017','03/31/2017','04/28/2017','05/31/2017','06/30/2017','07/31/2017','08/31/2017','09/29/2017','10/31/2017','11/30/2017','12/29/2017','01/31/2018','02/28/2018','03/30/2018','04/30/2018','05/31/2018','06/29/2018','07/31/2018','08/31/2018','09/28/2018','10/31/2018','11/30/2018','12/31/2018','01/31/2019','02/28/2019','03/29/2019','04/30/2019','05/31/2019','06/28/2019','07/31/2019','08/30/2019','12/31/2019','01/31/2020','02/17/2020')

select top 100 f.* 
from vradata.[dbo].[ModelFactorRawRank_US] f
	inner join (select Date, SecurityId
				from vra.dbo.universesecurity
				where 1=1
				and UniverseId = 1292 --USLC 15775
				and Date in ('01/29/2010','02/26/2010','03/31/2010','04/30/2010','05/31/2010','06/30/2010','07/30/2010','08/31/2010','09/30/2010','10/29/2010','11/30/2010','12/31/2010','01/31/2011','02/28/2011','03/31/2011','04/29/2011','05/31/2011','06/30/2011','07/29/2011','08/31/2011','09/30/2011','10/31/2011','11/30/2011','12/30/2011','01/31/2012','02/29/2012','03/30/2012','04/30/2012','05/31/2012','06/29/2012','07/31/2012','08/31/2012','09/28/2012','10/31/2012','11/30/2012','12/31/2012','01/31/2013','02/28/2013','03/29/2013','04/30/2013','05/31/2013','06/28/2013','07/31/2013','08/30/2013','09/30/2013','10/31/2013','11/29/2013','12/31/2013','01/31/2014','02/28/2014','03/31/2014','04/30/2014','05/30/2014','06/30/2014','07/31/2014','08/29/2014','09/30/2014','10/31/2014','11/28/2014','12/31/2014','01/30/2015','02/27/2015','03/31/2015','04/30/2015','05/29/2015','06/30/2015','07/31/2015','08/31/2015','09/30/2015','10/30/2015','11/30/2015','12/31/2015','01/29/2016','02/29/2016','03/31/2016','04/29/2016','05/31/2016','06/30/2016','07/29/2016','08/31/2016','09/30/2016','10/31/2016','11/30/2016','12/30/2016','01/31/2017','02/28/2017','03/31/2017','04/28/2017','05/31/2017','06/30/2017','07/31/2017','08/31/2017','09/29/2017','10/31/2017','11/30/2017','12/29/2017','01/31/2018','02/28/2018','03/30/2018','04/30/2018','05/31/2018','06/29/2018','07/31/2018','08/31/2018','09/28/2018','10/31/2018','11/30/2018','12/31/2018','01/31/2019','02/28/2019','03/29/2019','04/30/2019','05/31/2019','06/28/2019','07/31/2019','08/30/2019','12/31/2019','01/31/2020','02/17/2020')
				) u
		on f.Date = u.Date
		and f.SecurityId = u.SecurityId
		and FactorId in (249,146,7408,106,304,29,148,5,11,73)