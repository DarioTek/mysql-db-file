use financedb;

CREATE TABLE WATCH_LIST (
    SYMBOL VARCHAR(100) NOT NULL,
    YFINANCE_SYMBOL VARCHAR(100),
    GOOGLE_NEWS_SYMBOL VARCHAR(100),
	NAME VARCHAR(100),
    PRIMARY KEY (SYMBOL)
);

ALTER TABLE WATCH_LIST
DROP COLUMN DESCRIPTION;


INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('AAPL', 'AAPL', 'AAPL', 'Apple Inc.', 'Technology company specializing in consumer electronics and software.');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('ADBE', 'ADBE', 'ADBE', 'Adobe Inc.', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('TSLA', 'TSLA', 'TSLA', 'Tesla Inc.', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('NVDA', 'NVDA', 'NVDA', 'Nvidia Corp', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('SPX', '^SPX', 'SPX', 'S&P 500 Index', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('SPY', 'SPY', 'SPY', 'S&P 500 ETF', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('QQQ', 'QQQ', 'QQQ', 'Nasdaq ETF', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('IWM', 'IWM', 'IWM', 'Russell 2000 ETF', 'Small CAPs - small businesses');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('DIA', 'DIA', 'DIA', 'Dow Jones ETF', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('AMZN', 'AMZN', 'AMZN', 'Amazon', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('META', 'META', 'META', 'Meta', 'Facebook');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('NFLX', 'NFLX', 'NFLX', 'Netflix', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('MSFT', 'MSFT', 'MSFT', 'Microsoft', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('SDIV', 'SDIV', 'SDIV', 'Global X Super Dividend ETF', 'High Dividend Yield ETF');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('LLY', 'LLY', 'LLY', 'Eli Lilly and Company', 'Healthcare');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('COST', 'COST', 'COST', 'Costco', 'Retail Store');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('GS', 'GS', 'GS', 'Goldman Sachs', 'Financials');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('JPM', 'JPM', 'JPM', 'JP Morgan Chase', 'Financials');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('GOOGL', 'GOOGL', 'GOOGL', 'Google', '');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('CAT', 'CAT', 'Caterpillar (CAT)', 'Caterpillar', 'Construction');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('BA', 'BA', 'Bank of America (BA)', 'Bank of America', 'Financials');

INSERT INTO WATCH_LIST (SYMBOL, YFINANCE_SYMBOL, GOOGLE_NEWS_SYMBOL, NAME, DESCRIPTION)
VALUES ('MA', 'MA', 'Mastercard (MA)', 'Mastercard', 'Fin Tech');

DELETE FROM WATCH_LIST WHERE SYMBOL = 'CAT';

ROLLBACK;


UPDATE WATCH_LIST
SET 
GOOGLE_NEWS_SYMBOL = 'Tesla, Inc. (TSLA)',
NAME = 'Tesla, Inc.'
WHERE SYMBOL = 'TSLA';

COMMIT;

SELECT GOOGLE_NEWS_SYMBOL FROM WATCH_LIST ORDER BY SYMBOL;

SELECT SYMBOL, GOOGLE_NEWS_SYMBOL FROM WATCH_LIST ORDER BY SYMBOL;

SELECT * FROM WATCH_LIST WHERE SYMBOL <> 'SPX' ORDER BY SYMBOL;

select count(*) FROM WATCH_LIST;