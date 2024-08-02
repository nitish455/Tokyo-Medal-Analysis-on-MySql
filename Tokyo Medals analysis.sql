select * from [master].[dbo].[Tokyo Medals 2021]

-----the top 5 countries with the most gold medals:
select top 5 Country,[Gold Medal]
from [master].[dbo].[Tokyo Medals 2021]
order by [Gold Medal] desc

------ countries that have won more than 20 gold medals:
select country,[Gold Medal]
from [master].[dbo].[Tokyo Medals 2021]
where [Gold Medal]>20

------the total number of medals won by each country:
select country ,[Gold Medal]+[Silver Medal]+[Bronze Medal]as total_medal
from [master].[dbo].[Tokyo Medals 2021]

------the rank and total medals of countries that have won at least 10 gold medals
select country,[Gold Medal],Total,[Rank By Total]
from [master].[dbo].[Tokyo Medals 2021]
where [Gold Medal]>=10
order by [Gold Medal] desc

-----countries that won at least one medal of each type
SELECT country,[Gold Medal],[Silver Medal],[Bronze Medal]
from [master].[dbo].[Tokyo Medals 2021]
where [Gold Medal]>0 and [Silver Medal]>0 and [Bronze Medal]>0

------Percentage of Gold Medals among Total Medals for Each Country
select country,[Gold Medal],Total,
(cast([Gold Medal] as float)/Total)*100 as gold_medal_percent
from [master].[dbo].[Tokyo Medals 2021]
order by Total desc

------Countries with No Gold Medals
select country,[Gold Medal]
from [master].[dbo].[Tokyo Medals 2021]
where [Gold Medal]=0

-----Average Number of Medals (Gold, Silver, Bronze) per Country
SELECT country,
AVG(CAST([Gold Medal] AS INT)) AS Avg_Gold_Medals,
       AVG(CAST([Silver Medal] AS INT)) AS Avg_Silver_Medals,
       AVG(CAST([Bronze Medal] AS INT)) AS Avg_Bronze_Medals
from [master].[dbo].[Tokyo Medals 2021]
group by  Country

-----Comparative Analysis: Gold vs. Silver vs. Bronze Medals
select country,[Gold Medal],[Silver Medal],[Bronze Medal]
from [master].[dbo].[Tokyo Medals 2021]
order by [Gold Medal] desc,[Silver Medal] desc,[Bronze Medal] desc

----Countries with a High Ratio of Gold to Silver Medals
select top 5 country,[Gold Medal],[Silver Medal],
(cast([Gold Medal] as float)/[Silver Medal]) as Gold_To_Silver_Ratio
from [master].[dbo].[Tokyo Medals 2021]
where [Silver Medal]>0
order by Gold_To_Silver_Ratio desc

----Performance Analysis: Top 5 Countries by Each Medal Type
select top 5 'Gold' as medal_type,country,[Gold Medal]
from [master].[dbo].[Tokyo Medals 2021]
order by [Gold Medal] desc

select top 5 'silver' as medal_type,country,[Silver Medal]
from [master].[dbo].[Tokyo Medals 2021]
order by [Silver Medal] desc

select top 5 'bronze' as medal_type,country,[Bronze Medal]
from [master].[dbo].[Tokyo Medals 2021]
order by [Bronze Medal] desc


----Grading according to toatl medal
SELECT Country, 
       [Gold Medal], 
       [Silver Medal], 
       [Bronze Medal], 
       Total,
	   case
	   when Total>=100 then 'A+'
	   WHEN Total>=80 then 'A'
	   when Total>=60 then 'B+'
	   when Total>=40 then 'B'
	   when Total>=20 then 'C'
	   else 'D'
	   end as grade
from [master].[dbo].[Tokyo Medals 2021]
