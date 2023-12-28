use dariotek;

select * from dariotek.SPX_OHLC_MINUTES;

SELECT * FROM dariotek.SPX_OHLC_MINUTES 
WHERE Datetime BETWEEN '2023-11-09 09:30:00' AND '2023-11-09 10:30:00';
