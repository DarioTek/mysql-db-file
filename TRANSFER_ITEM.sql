use financedb;

CREATE TABLE TRANSFER_ITEM (
	ACTIVITY_ID VARCHAR(100) NOT NULL, # Link to TRANSACTIONS table
    INSTRUMENT_ASSSET_TYPE VARCHAR(100) NOT NULL,
    INSTRUMENT_STATUS VARCHAR(100) NOT NULL,
    INSTRUMENT_SYMBOL VARCHAR(100) NOT NULL,
    INSTRUMENT_DESCRIPTION VARCHAR(100) NOT NULL,
    INSTRUMENT_ID VARCHAR(100) NOT NULL,
    EXPIRATION_DATE DATETIME, # May not always be available
    CLOSING_PRICE DECIMAL(12, 4), # May not always be available
    INSTRUMENT_CLOSING_PRICE DECIMAL(12, 4), # May not always be available
    AMOUNT DECIMAL(12, 4), # May not always be available
    COST DECIMAL(12, 4), # May not always be available
    FEE_TYPE VARCHAR(100), # May not always be available
    
    PRICE DECIMAL(12, 4), # May not always be available
    POSITION_EFFECT VARCHAR(100) # May not always be available
);
