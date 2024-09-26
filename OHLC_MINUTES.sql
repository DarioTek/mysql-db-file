/*
 * See latest records
 */
SELECT 
	*
FROM 
	OHLC_MINUTES
ORDER BY
	Datetime DESC;
 
/*
 * See latest records for a particular Ticker Symbol
 */
SELECT 
	*
FROM 
	OHLC_MINUTES
WHERE
	Ticker = 'TSLA' AND
	DATE(Datetime) = (SELECT MAX(DATE(Datetime)) FROM OHLC_MINUTES);
