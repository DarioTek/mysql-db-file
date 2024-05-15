/* 
 * Run the use financedb command first so that you don't need to prequalify the table name references.
 */
use financedb;

/*
 * Generic select all records from SPX_OHLC_MINUTES
 */
select * from SPX_OHLC_MINUTES;

/*
 * Generic select all records from OHLC_MINUTES
 */
select count(*) from OHLC_MINUTES;

select count(distinct Ticker) from OHLC_MINUTES;

select count(*) from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');

select DISTINCT Ticker from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');

select count(DISTINCT Ticker) from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');

/*
 * check the count of minutes record for each day 
 * typically 390 in a full trading day
 * typically 210 in a shortened trading day
*/
select date(Datetime), count(*) from SPX_OHLC_MINUTES
GROUP BY date(Datetime)
ORDER BY date(Datetime);

select Ticker, date(Datetime), count(*) from OHLC_MINUTES
GROUP BY Ticker, date(Datetime)
ORDER BY Ticker, date(Datetime);

/*
 * select ount of unique records in a column
 */

SELECT COUNT(DISTINCT Datetime) FROM SPX_OHLC_MINUTES;

SELECT COUNT(DISTINCT date(Datetime)) as UNIQUE_DATES FROM SPX_OHLC_MINUTES;


/*
 * Select records for a particular day
 */
select * from SPX_OHLC_MINUTES where date(Datetime) >= '2024-05-02';

select * from OHLC_MINUTES;

/*
 * Show the DDL statement to create the table in a different server for example.
 */
SHOW CREATE TABLE OHLC_MINUTES;

/*
 * Shows the columns in a table 2 diffent ways of doing it in MySQL
 */
DESCRIBE OHLC_MINUTES;

SHOW COLUMNS FROM OHLC_MINUTES;


/*
 * Show keys for a particular table
 */
SHOW KEYS FROM OHLC_MINUTES WHERE Key_name = 'PRIMARY';

SHOW KEYS FROM SPX_OHLC_MINUTES WHERE Key_name = 'PRIMARY';


/*
 * Command to create a column as a primary key
 */
# ALTER TABLE SPX_OHLC_MINUTES ADD PRIMARY KEY (Datetime);

/*
 * Add Composite Key
 */
# ALTER TABLE OHLC_MINUTES ADD PRIMARY KEY (Ticker, Datetime);

/*
 * Deletea record in a table
 */
#delete from OHLC_MINUTES where Ticker = '^SPX';
#delete from SPX_OHLC_MINUTES where date(Datetime) >= '2024-05-02';
#commit;

/*
 * set the SQL_SAFE_UPDATES = 0 in RaspberryPi MySQL iand set it back SQL_SAFE_UPDATES = 1 after deletes
 */
#SET SQL_SAFE_UPDATES = 1;