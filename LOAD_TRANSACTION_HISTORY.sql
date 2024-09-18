use financedb;

/*
 * All Transactions for each of the 4 accounts
 */
SELECT 
	*
FROM
	LOAD_TRANSACTION_HISTORY;
    

/*
 * Number of transactions for 2024 
 */
SELECT 
	SOURCE,
    COUNT(SOURCE)
FROM
	LOAD_TRANSACTION_HISTORY
WHERE
	RECORD_DATE >= '2024-01-01'
GROUP BY 
	SOURCE;


SELECT 
	*
FROM
	LOAD_TRANSACTION_HISTORY;
