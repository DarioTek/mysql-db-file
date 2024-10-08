CREATE TABLE POSITION (
    ACCOUNT_NUMBER VARCHAR(100) NOT NULL,
    RECORD_DATE DATE,
    SHORT_QUANTITY DECIMAL(12, 4),
    AVERAGE_PRICE DECIMAL(12, 4),
    CURRENT_DAY_PROFIT_LOSS DECIMAL(12, 4),
    CURRENT_DAY_PROFIT_LOSS_PERCENTAGE DECIMAL(12, 4),
    LONG_QUANTITY DECIMAL(12, 4),
    SETTLED_LONG_QUANTITY DECIMAL(12, 4),
    SETTLED_SHORT_QUANTITY DECIMAL(12, 4),
    ASSET_TYPE VARCHAR(100),
    CUSIP VARCHAR(100),
    SYMBOL VARCHAR(100),
    POSITION_DESCRIPTION VARCHAR(100),
    NET_CHANGE DECIMAL(12, 4),
    POSITION_INSTRUMENT_TYPE VARCHAR(100),
    PUT_CALL VARCHAR(100),
    UNDERLYING_SYMBOL VARCHAR(100),
    MARKET_VALUE DECIMAL(12, 4),
    MAINTENANCE_REQUIREMENT DECIMAL(12, 4),
    AVERAGE_SHORT_PRICE DECIMAL(12, 4),
    TAX_LOT_AVERAGE_SHORT_PRICE DECIMAL(12, 4),
    SHORT_OPEN_PROFIT_LOSS DECIMAL(12, 4),
    PREVIOUS_SESSION_SHORT_QUANTITY DECIMAL(12, 4),
    AVERAGE_LONG_PRICE DECIMAL(12, 4),
    TAX_LOT_AVERAGE_LONG_PRICE DECIMAL(12, 4),
    LONG_OPEN_PROFIT_LOSS DECIMAL(12, 4),
    PREVIOUS_SESSION_LONG_QUANTITY DECIMAL(12, 4),
    CURRENT_DAY_COST DECIMAL(12, 4),
    PRIMARY KEY (ACCOUNT_NUMBER, RECORD_DATE, SYMBOL)
);

/*
 * Queries for the POSITION table
 */ 
use financedb;

SELECT * FROM POSITION ORDER BY RECORD_DATE DESC;

SELECT COUNT(*) FROM POSITION;

SELECT * FROM POSITION WHERE DATE(RECORD_DATE) = curdate();

SELECT * FROM POSITION WHERE DATE(RECORD_DATE) = (SELECT MAX(RECORD_DATE) FROM POSITION);

SELECT COUNT(*) FROM POSITION WHERE DATE(RECORD_DATE) = (SELECT MAX(RECORD_DATE) FROM POSITION);

SELECT
	SYMBOL,
    PUT_CALL,
    SHORT_QUANTITY,
    LONG_QUANTITY,
    SHORT_OPEN_PROFIT_LOSS,
    LONG_OPEN_PROFIT_LOSS,
    MAINTENANCE_REQUIREMENT,
    AVERAGE_PRICE,
    MARKET_VALUE
FROM 
	POSITION 
WHERE 
	DATE(RECORD_DATE) = (SELECT MAX(RECORD_DATE) FROM POSITION)
ORDER BY SYMBOL;

/*
 * Maintenace Requirement per Account
 */
SELECT
	TEMP.ACCOUNT_NUMBER,
    IS_DAY_TRADER,
    AGG_BALANCE_LIQUIDATION_VALUE,
    COUNT(TEMP.MAINTENANCE_REQUIREMENT) AS NUMBER_OF_POSITIONS,
	SUM(TEMP.MAINTENANCE_REQUIREMENT) AS MAINTENANCE_REQUIREMENT
FROM
	 (
	SELECT
		ACCOUNT_NUMBER,
		MAINTENANCE_REQUIREMENT,
        AGG_BALANCE_LIQUIDATION_VALUE,
        IS_DAY_TRADER
	FROM 
		POSITION_VIEW
	WHERE 
		DATE(RECORD_DATE) = (SELECT MAX(RECORD_DATE) FROM POSITION)
	ORDER BY SYMBOL
	) AS TEMP
GROUP BY TEMP.ACCOUNT_NUMBER;
