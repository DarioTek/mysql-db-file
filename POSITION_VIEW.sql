CREATE OR REPLACE VIEW POSITION_VIEW AS
SELECT
	A.ACCOUNT_NUMBER,
    A.RECORD_DATE,
    A.HASH_VALUE,
    A.TYPE AS ACCOUNT_TYPE,
    A.ROUND_TRIPS,
    A.IS_DAY_TRADER,
    A.IS_CLOSING_ONLY_RESTRICTED,
    A.PFCB_FLAG,
    A.AGG_BALANCE_CURRENT_LIQUIDATION_VALUE,
    A.AGG_BALANCE_LIQUIDATION_VALUE,
    
    I.ACCRUED_INTEREST AS IB_ACCRUED_INTEREST,
    I.AVAILABLE_FUNDS_NON_MARGINABLE_TRADE AS IB_AVAILABLE_FUNDS_NON_MARGINABLE_TRADE,
    I.BOND_VALUE AS IB_BOND_VALUE,
    I.BUYING_POWER AS IB_BUYING_POWER,
    I.CASH_BALANCE AS IB_CASH_BALANCE,
    I.CASH_AVAILABLE_FOR_TRADING AS IB_CASH_AVAILABLE_FOR_TRADING,    
    I.CASH_RECEIPTS AS IB_CASH_RECEIPTS,
    I.DAY_TRADING_BUYING_POWER AS IB_DAY_TRADING_BUYING_POWER,
	I.DAY_TRADING_BUYING_POWER_CALL AS IB_DAY_TRADING_BUYING_POWER_CALL,
    I.DAY_TRADING_EQUITY_CALL AS IB_DAY_TRADING_EQUITY_CALL,
    I.EQUITY AS IB_EQUITY,
    I.EQUITY_PERCENTAGE AS IB_EQUITY_PERCENTAGE,
    I.LIQUIDATION_VALUE AS IB_LIQUIDATION_VALUE,
    I.LONG_MARGIN_VALUE AS IB_LONG_MARGIN_VALUE,
    I.LONG_OPTION_MARKET_VALUE AS IB_LONG_OPTION_MARKET_VALUE,
    I.LONG_STOCK_VALUE AS IB_LONG_STOCK_VALUE,
    I.MAINTENANCE_CALL AS IB_MAINTENANCE_CALL,
    I.MAINTENANCE_REQUIREMENT AS IB_MAINTENANCE_REQUIREMENT,
    I.MARGIN AS IB_MARGIN,
    I.MARGIN_EQUITY AS IB_MARGIN_EQUITY,
    I.MONEY_MARKET_FUND AS IB_MONEY_MARKET_FUND,
    I.MUTUAL_FUND_VALUE AS IB_MUTUAL_FUND_VALUE,
    I.REG_T_CALL AS IB_REG_T_CALL,
    I.SHORT_MARGIN_VALUE AS IB_SHORT_MARGIN_VALUE,
    I.SHORT_OPTION_MARKET_VALUE AS IB_SHORT_OPTION_MARKET_VALUE,
    I.SHORT_OPTION_STOCK_VALUE AS IB_SHORT_OPTION_STOCK_VALUE,
    I.TOTAL_CASH AS IB_TOTAL_CASH,
    I.IS_IN_CALL AS IB_IS_IN_CALL,
    I.PENDING_DEPOSITS AS IB_PENDING_DEPOSITS,
    I.MARGIN_BALANCE AS IB_MARGIN_BALANCE,
    I.SHORT_BALANCE AS IB_SHORT_BALANCE,
    I.ACCOUNT_VALUE AS IB_ACCOUNT_VALUE,    
    
	C.ACCRUED_INTEREST AS CB_ACCRUED_INTEREST,
	C.CASH_BALANCE AS CB_CASH_BALANCE,
	C.CASH_RECEIPTS AS CB_CASH_RECEIPTS,
	C.LONG_OPTION_MARKET_VALUE AS CB_LONG_OPTION_MARKET_VALUE,
	C.LIQUIDATION_VALUE AS CB_LIQUIDATION_VALUE,
	C.LONG_MARKET_VALUE AS CB_LONG_MARKET_VALUE,
	C.MONEY_MARKET_FUND AS CB_MONEY_MARKET_FUND,
	C.SAVINGS AS CB_SAVINGS,
	C.SHORT_MARKET_VALUE AS CB_SHORT_MARKET_VALUE,
	C.PENING_DEPOSITS AS CB_PENING_DEPOSITS,
	C.MUTUAL_FUND_VALUE AS CB_MUTUAL_FUND_VALUE,
	C.BOND_VALUE AS CB_BOND_VALUE,
	C.SHORT_OPTION_MARKET_VALUE AS CB_SHORT_OPTION_MARKET_VALUE,
	C.AVAILABLE_FUNDS AS CB_AVAILABLE_FUNDS,
	C.AVAILABLE_FUNDS_NON_MARGINABLE_TRADE AS CB_AVAILABLE_FUNDS_NON_MARGINABLE_TRADE,
	C.BUYING_POWER AS CB_BUYING_POWER,
	C.BUYING_POWER_NON_MARGINABLE_TRADE AS CB_BUYING_POWER_NON_MARGINABLE_TRADE,
	C.DAY_TRADING_BUYING_POWER AS CB_DAY_TRADING_BUYING_POWER,
	C.EQUITY AS CB_EQUITY,
	C.EQUITY_PERCENTAGE AS CB_EQUITY_PERCENTAGE,
	C.LONG_MARGIN_VALUE AS CB_LONG_MARGIN_VALUE,
	C.MAINTENANCE_CALL AS CB_MAINTENANCE_CALL,
	C.MAINTENANCE_REQUIREMENT AS CB_MAINTENANCE_REQUIREMENT,
	C.MARGIN_BALANCE AS CB_MARGIN_BALANCE,
	C.REG_T_CALL AS CB_REG_T_CALL,
	C.SHORT_BALANCE AS CB_SHORT_BALANCE,
	C.SHORT_MARGIN_VALUE AS CB_SHORT_MARGIN_VALUE,
	C.SMA AS CB_SMA,
    
	PR.AVAILABLE_FUNDS AS PB_AVAILABLE_FUNDS,
	PR.AVAILABLE_FUNDS_NON_MARGINABLE_TRADE AS PB_AVAILABLE_FUNDS_NON_MARGINABLE_TRADE,
	PR.BUYING_POWER AS PB_BUYING_POWER,
	PR.DAY_TRADING_BUYING_POWER AS PB_DAY_TRADING_BUYING_POWER,
	PR.DAY_TRADING_BUYING_POWER_CALL AS PB_DAY_TRADING_BUYING_POWER_CALL,
	PR.MAINTENANCE_CALL AS PB_MAINTENANCE_CALL,
	PR.REG_T_CALL AS PB_REG_T_CALL,
	PR.IS_IN_CALL AS PB_IS_IN_CALL,
	PR.STOCK_BUYING_POWER AS PB_STOCK_BUYING_POWER,

    P.SHORT_QUANTITY,
	P.AVERAGE_PRICE,
    P.CURRENT_DAY_PROFIT_LOSS,
    P.CURRENT_DAY_PROFIT_LOSS_PERCENTAGE,
    P.LONG_QUANTITY,
    P.SETTLED_LONG_QUANTITY,
    P.SETTLED_SHORT_QUANTITY,
    P.ASSET_TYPE,
    P.CUSIP,
    P.SYMBOL,
    P.POSITION_DESCRIPTION,
    P.NET_CHANGE,
    P.POSITION_INSTRUMENT_TYPE,
    P.PUT_CALL,
    P.UNDERLYING_SYMBOL,
    P.MARKET_VALUE,
    P.MAINTENANCE_REQUIREMENT,
    P.AVERAGE_SHORT_PRICE,
    P.TAX_LOT_AVERAGE_SHORT_PRICE,
    P.SHORT_OPEN_PROFIT_LOSS,
    P.PREVIOUS_SESSION_SHORT_QUANTITY,
    P.AVERAGE_LONG_PRICE,
    P.TAX_LOT_AVERAGE_LONG_PRICE,
    P.LONG_OPEN_PROFIT_LOSS,
    P.PREVIOUS_SESSION_LONG_QUANTITY,
    P.CURRENT_DAY_COST
FROM
	ACCOUNT A,
    POSITION P,
    INITIAL_BALANCE I,
    CURRENT_BALANCE C,
    PROJECTED_BALANCE PR
WHERE
	P.ACCOUNT_NUMBER = A.ACCOUNT_NUMBER AND
    P.RECORD_DATE    = A.RECORD_DATE    AND
    P.ACCOUNT_NUMBER = I.ACCOUNT_NUMBER AND
    P.RECORD_DATE    = I.RECORD_DATE    AND
    P.ACCOUNT_NUMBER = C.ACCOUNT_NUMBER AND
    P.RECORD_DATE    = C.RECORD_DATE    AND
    P.ACCOUNT_NUMBER = PR.ACCOUNT_NUMBER AND
    P.RECORD_DATE    = PR.RECORD_DATE;


/* 
 * QUERY FOR POSITION_VIEW
 */ 
select count(*) from POSITION_VIEW;

select count(*) from POSITION WHERE DATE(RECORD_DATE) = CURDATE();

select count(*) from POSITION WHERE DATE(RECORD_DATE) = '2024-06-02';

select count(*) from POSITION_VIEW WHERE date(RECORD_DATE) = '2024-06-03';

/*
 * CURRENT LIQUIDATION VALUE OF ALL ACCOUNTS BASED ON CURRENT DATE
 */
select ACCOUNT_NUMBER, sum(CB_LIQUIDATION_VALUE) AS LIQUDATION_VALUE
FROM POSITION_VIEW WHERE date(RECORD_DATE) = CURDATE()
GROUP BY ACCOUNT_NUMBER;

select count(*) from POSITION_VIEW;