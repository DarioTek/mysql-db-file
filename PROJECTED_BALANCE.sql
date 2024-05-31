CREATE TABLE PROJECTED_BALANCE (
    ACCOUNT_NUMBER VARCHAR(100) NOT NULL,
	availableFunds DECIMAL(12, 4),
    availableFundsNonMarginableTrade DECIMAL(12, 4),
    buyingPower DECIMAL(12, 4),
    dayTradingBuyingPower DECIMAL(12, 4),
    dayTradingBuyingPowerCall DECIMAL(12, 4),
    maintenanceCall DECIMAL(12, 4),
    regTCall DECIMAL(12, 4),
    isInCall BOOLEAN,
    stockBuyingPower DECIMAL(12, 4)
);