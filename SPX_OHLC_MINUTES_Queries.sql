/* Use dariotek schema */
use dariotek;

# Generic select all records from the table
select * from dariotek.SPX_OHLC_MINUTES;

show create table dariotek.SPX_OHLC_MINUTES;

show create table dariotek.SPX_OHLC_DAILY;

-- is another way to comment in MySQL
select count(*) from dariotek.SPX_OHLC_MINUTES;

/*
use the date function to get the date from the Datetime column
*/
select distinct date(Datetime) from dariotek.SPX_OHLC_MINUTES;

/*
check the count of minutes record for each day 
typically 390 in a full trading day
typically 210 in a shortened trading day
*/
select date(Datetime), count(*) from dariotek.SPX_OHLC_MINUTES
GROUP BY date(Datetime)
ORDER BY date(Datetime);

select date(Datetime), count(*) from financedb.OHLC_MINUTES
GROUP BY date(Datetime)
ORDER BY date(Datetime);

# Select all unique date from datetime
select distinct date(Datetime) from dariotek.SPX_OHLC_MINUTES ORDER BY date(Datetime);

# Count of all unique dates collected in the database
select count(distinct date(Datetime)) from dariotek.SPX_OHLC_MINUTES ORDER BY date(Datetime);

# Select records between certain datetime
SELECT * FROM dariotek.SPX_OHLC_MINUTES 
WHERE Datetime BETWEEN '2023-11-09 09:30:00' AND '2023-11-09 10:30:00';
