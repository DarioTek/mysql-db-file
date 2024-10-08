CREATE OR REPLACE VIEW TRANSACTIONS_VIEW AS
SELECT
    T.ACTIVITY_ID,
	T.RECORD_TIME,  
    T.DESCRIPTION,
    T.ACCOUNT_NUMBER,
    T.TYPE,
    T.STATUS,
    T.SUB_ACCOUNT,
    T.TRADE_DATE,
    T.POSITION_ID,
    T.SETTLEMENT_DATE,
    T.ORDER_ID,
    T.NET_AMOUNT,
    TI.INSTRUMENT_ASSSET_TYPE,
    TI.INSTRUMENT_STATUS,
    TI.INSTRUMENT_SYMBOL,
    TI.INSTRUMENT_DESCRIPTION,
    TI.INSTRUMENT_ID,
    TI.INSTRUMENT_EXPIRATION_DATE,
    TI.INSTRUMENT_CLOSING_PRICE,    
    TI.INSTRUMENT_OPTION_PREMIUM_MULTIPLIER,
    TI.INSTRUMENT_PUT_CALL,
    TI.INSTRUMENT_STRIKE_PRICE,
    TI.INSTRUMENT_TYPE,
    TI.INSTRUMENT_UNDERLYING_SYMBOL,
    TI.INSTRUMENT_UNDERLYING_CUSIP,    
    TI.AMOUNT,
    TI.COST,
    TI.FEE_TYPE,
    TI.PRICE,
    TI.POSITION_EFFECT,    
    TOD.ROOT_SYMBOL,
    TOD.STRIKE_PERCENT,
    TOD.DELIVERABLE_NUMBER,
    TOD.DELIVERABLE_UNITS,    
    TOD.DELIVERABLE_ASSET_TYPE,
    TOD.DELIVERABLE_STATUS,
    TOD.DELIVERABLE_SYMBOL,
    TOD.DELIVERABLE_DESCRIPTION,
    TOD.DELIVERABLE_INSTRUMENT_ID,
    TOD.DELIVERABLE_CLOSING_PRICES,
    TOD.DELIVERABLE_TYPE    
FROM 
    TRANSACTIONS T
JOIN 
    TRANSFER_ITEM TI 
ON 
    T.ACTIVITY_ID = TI.ACTIVITY_ID
LEFT JOIN 
    TRANSFER_ITEM_OPTION_DELIVERABLE TOD 
ON 
    T.ACTIVITY_ID = TOD.ACTIVITY_ID;

###############################################################################################################
#                                        QUERIES FOR TRANSACTIONS_VIEW                                        #
###############################################################################################################

use financedb;

SELECT * FROM TRANSACTIONS_VIEW order by RECORD_TIME DESC; 

SELECT COUNT(*) FROM TRANSACTIONS_VIEW; # 4178

SELECT * FROM TRANSACTIONS_VIEW 
WHERE ROOT_SYMBOL IS NULL; 

SELECT ACTIVITY_ID FROM TRANSACTIONS_VIEW 
WHERE ROOT_SYMBOL IS NULL; 


SELECT COUNT(*) FROM TRANSACTIONS_VIEW 
WHERE ROOT_SYMBOL IS NULL; 

SELECT * FROM POSITION_VIEW WHERE RECORD_DATE = '2024-05-03';

SELECT *
FROM POSITION_VIEW
WHERE RECORD_DATE = '2024-05-03';


SELECT MIN(RECORD_DATE) FROM POSITION_VIEW;

SELECT DISTINCT(RECORD_DATE), COUNT(RECORD_DATE) FROM POSITION_VIEW GROUP BY RECORD_DATE;

