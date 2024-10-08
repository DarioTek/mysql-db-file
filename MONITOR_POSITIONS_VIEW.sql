SELECT
	RECORD_DATE,
	ACCOUNT_DESCRIPTION,
	ASSET_TYPE,
    SYMBOL,
    POSITION_DESCRIPTION,
    PUT_CALL,
	SHORT_QUANTITY,
    AVERAGE_SHORT_PRICE,
	LONG_QUANTITY,
    AVERAGE_LONG_PRICE,                    
	OPEN_INTEREST,
	DAYS_TO_EXPIRATION,
	VOLATILIY,
	DELTA,
	GAMMA,
	THETA,
	RHO,
	VEGA
FROM 
	POSITION_VIEW
ORDER BY 
	DAYS_TO_EXPIRATION, SYMBOL;
