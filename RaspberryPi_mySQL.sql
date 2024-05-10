use financedb;

select * from SPX_OHLC_MINUTES;


/*
check the count of minutes record for each day 
typically 390 in a full trading day
typically 210 in a shortened trading day
*/
select date(Datetime), count(*) from SPX_OHLC_MINUTES
GROUP BY date(Datetime)
ORDER BY date(Datetime);

select Ticker, date(Datetime), count(*) from OHLC_MINUTES
GROUP BY Ticker, date(Datetime)
ORDER BY Ticker, date(Datetime);


select * from SPX_OHLC_MINUTES where date(Datetime) >= '2024-05-02';

ALTER TABLE SPX_OHLC_MINUTES ADD PRIMARY KEY (Datetime);

select * from OHLC_MINUTES;

/*
 * Add Composite Key
 */
ALTER TABLE OHLC_MINUTES ADD PRIMARY KEY (Ticker, Datetime);

SHOW KEYS FROM OHLC_MINUTES WHERE Key_name = 'PRIMARY';

SHOW KEYS FROM SPX_OHLC_MINUTES WHERE Key_name = 'PRIMARY';



select count(*) from OHLC_MINUTES where Ticker = '^SPX';

#delete from OHLC_MINUTES where Ticker = '^SPX';

#delete from SPX_OHLC_MINUTES where date(Datetime) >= '2024-05-02';
#commit;

#SET SQL_SAFE_UPDATES = 1;