/* 
 * Run the use financedb command first so that you don't need to prequalify the table name references.
 */
use financedb;

select * from DAILY_BALANCE;

SELECT 
	RECORD_DATE, 
    ACCOUNT_NUMBER, 
    SUM(LIQUIDITY_VALUE) 
FROM DAILY_BALANCE 
WHERE DATE(RECORD_DATE) = CURDATE()
GROUP BY RECORD_DATE, ACCOUNT_NUMBER, LIQUIDITY_VALUE;

SELECT 
	RECORD_DATE, 
    ACCOUNT_NUMBER, 
    SUM(LIQUIDITY_VALUE) 
FROM DAILY_BALANCE 
# WHERE DATE(RECORD_DATE) = CURDATE()
WHERE DATE(RECORD_DATE) = (SELECT MAX(RECORD_DATE) FROM DAILY_BALANCE)
GROUP BY RECORD_DATE, ACCOUNT_NUMBER, LIQUIDITY_VALUE;


select* from ACCOUNT ORDER BY RECORD_DATE DESC;

select * from POSITION ORDER BY RECORD_DATE DESC;

select * from POSITION ORDER BY SYMBOL;

select count(*) from POSITION WHERE date(RECORD_DATE) = CURDATE();

select ACCOUNT_NUMBER, count(*) from POSITION GROUP BY ACCOUNT_NUMBER;

select sum(liquidity_value) from DAILY_BALANCE WHERE date(RECORD_DATE) = CURDATE();

select * from DAILY_BALANCE;

select LIQUIDITY_VALUE as LIQUIDITY_VALUE_AM from DAILY_NET_BALANCE WHERE RECORD_DATE = (select MIN(RECORD_DATE) from DAILY_NET_BALANCE WHERE date(RECORD_DATE) = CURDATE()
GROUP BY date(RECORD_DATE));

select LIQUIDITY_VALUE as LIQUIDITY_VALUE_PM from DAILY_NET_BALANCE WHERE RECORD_DATE = (select MAX(RECORD_DATE) from DAILY_NET_BALANCE WHERE date(RECORD_DATE) = CURDATE()
GROUP BY date(RECORD_DATE));

select 
(select LIQUIDITY_VALUE as LIQUIDITY_VALUE_PM from DAILY_NET_BALANCE WHERE RECORD_DATE = (select MAX(RECORD_DATE) from DAILY_NET_BALANCE WHERE date(RECORD_DATE) = CURDATE()
GROUP BY date(RECORD_DATE))) - 
(select LIQUIDITY_VALUE as LIQUIDITY_VALUE_AM from DAILY_NET_BALANCE WHERE RECORD_DATE = (select MIN(RECORD_DATE) from DAILY_NET_BALANCE WHERE date(RECORD_DATE) = CURDATE()
GROUP BY date(RECORD_DATE))) 
as NetChange;


select 'SPX' as Ticker, date(Datetime) as Date, count(*) as count from SPX_OHLC_MINUTES WHERE date(Datetime) >= CURDATE()
GROUP BY date(Datetime)
ORDER BY date(Datetime);

SELECT Ticker, date(Datetime) as Date, count(*) as count FROM OHLC_MINUTES WHERE date(Datetime) >= CURDATE()
GROUP BY Ticker, date(Datetime)
ORDER BY Ticker, date(Datetime);

/*
 * Generic select all records from SPX_OHLC_MINUTES
 */
select * from SPX_OHLC_MINUTES ORDER BY DATETIME DESC;

select count(*) from SPX_OHLC_MINUTES;

select * from SPX_OHLC_MINUTES where DATE(Datetime) = curdate();

select max(datetime) from SPX_OHLC_MINUTES;

SELECT TICKER, RECORD_DATE, COUNT FROM (
SELECT 'SPX' AS TICKER, DATE(DATETIME) AS RECORD_DATE, COUNT(*) AS COUNT FROM SPX_OHLC_MINUTES WHERE DATE(DATETIME) = curdate()
UNION
SELECT TICKER, DATE(DATETIME) AS RECORD_DATE, COUNT(*) AS COUNT FROM OHLC_MINUTES WHERE DATE(DATETIME) = CURDATE() GROUP BY TICKER
) AS A ORDER BY A.TICKER;

SELECT TICKER, RECORD_DATE, COUNT FROM (
SELECT 'SPX' AS TICKER, DATE(DATETIME) AS RECORD_DATE, COUNT(*) AS COUNT FROM SPX_OHLC_MINUTES WHERE DATE(DATETIME) = (SELECT MAX(DATE(DATETIME)) FROM SPX_OHLC_MINUTES)
UNION
SELECT TICKER, DATE(DATETIME) AS RECORD_DATE, COUNT(*) AS COUNT FROM OHLC_MINUTES WHERE DATE(DATETIME) = (SELECT MAX(DATE(DATETIME)) FROM OHLC_MINUTES) GROUP BY TICKER
) AS A ORDER BY A.TICKER;

SELECT MAX(DATETIME) FROM SPX_OHLC_MINUTES;

/*
 * Generic select all records from OHLC_MINUTES
 */
select count(*) from OHLC_MINUTES;

select * from OHLC_MINUTES order by Datetime desc;

SELECT TICKER, DATE(DATETIME) AS RECORD_DATE, COUNT(*) AS COUNT FROM OHLC_MINUTES WHERE DATE(DATETIME) = CURDATE() GROUP BY TICKER;

select count(distinct Ticker) from OHLC_MINUTES;

select count(*) from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');

select DISTINCT Ticker from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');

select count(DISTINCT Ticker) from OHLC_MINUTES 
WHERE Ticker not in ('SPY','QQQ','IWM','DIA','AAPL', 'MSFT', 'GOOGL','TSLA','NVDA','CAT','NFLX','META','GS','BA','MA','LLY','COST');


SELECT * FROM OHLC_MINUTES
WHERE 
Ticker = 'SPY' AND
Datetime BETWEEN '2024-05-14' AND '2024-05-15';

SELECT * FROM OHLC_MINUTES
WHERE 
Ticker = 'SPY' AND 
Datetime = CURDATE();

SELECT * FROM SPX_OHLC_MINUTES
WHERE 
Datetime = CURDATE();

SELECT CURDATE();

SELECT NOW();


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
select * from SPX_OHLC_MINUTES where date(Datetime) >= '2024-05-15';

select * from SPX_OHLC_MINUTES where date(Datetime) >= CURDATE();

select DISTINCT Ticker from OHLC_MINUTES where date(Datetime) >= CURDATE();



SELECT CURDATE();

SELECT NOW();

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


select * from CONFIG;

rollback;

INSERT INTO CONFIG (`ATTRIBUTE`, `VALUE`)
VALUES ('access_token', 'XXXX');

INSERT INTO CONFIG (`ATTRIBUTE`, `VALUE`)
VALUES ('refresh_token', 'XXXX');


INSERT INTO CONFIG (`ATTRIBUTE`, `VALUE`)
VALUES ('app_key', 'OFEkYRyfCCk7W79SL90KrPjWtOElBs7E');

INSERT INTO CONFIG (`ATTRIBUTE`, `VALUE`)
VALUES ('app_secret', 'TEZKIUQuEBleTxfE');

commit;

UPDATE CONFIG
SET `VALUE` = 'app_key'
WHERE `ATTRIBUTE` = 'exampleKey';


select * from DAILY_NET_CHANGE;