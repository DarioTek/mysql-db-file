
use dariotek;

/************************************************************/

DROP TABLE IF EXISTS `SPX_OHLC_DAILY`;

CREATE TABLE `SPX_OHLC_DAILY` (
  `Date` date not null,
  `Open` decimal(16, 6) NOT NULL,
  `High` decimal(16, 6) NOT NULL,
  `Low` decimal(16, 6) NOT NULL,
  `Close` decimal(16, 6) NOT NULL,
  `Adj_Close` decimal(16, 6) NOT NULL,
  `Volume` numeric NOT NULL,
  PRIMARY KEY (`Date`)
); 
