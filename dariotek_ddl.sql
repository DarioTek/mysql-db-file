/* Use dariotek schema */
use dariotek;

CREATE TABLE `SPX_OHLC_MINUTES` (
  `Datetime` timestamp NOT NULL,
  `Open` decimal(16,6) NOT NULL,
  `High` decimal(16,6) NOT NULL,
  `Low` decimal(16,6) NOT NULL,
  `Close` decimal(16,6) NOT NULL,
  `Adj_Close` decimal(16,6) NOT NULL,
  `Volume` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `SPX_OHLC_DAILY` (
  `Date` date NOT NULL,
  `Open` decimal(16,6) NOT NULL,
  `High` decimal(16,6) NOT NULL,
  `Low` decimal(16,6) NOT NULL,
  `Close` decimal(16,6) NOT NULL,
  `Adj_Close` decimal(16,6) NOT NULL,
  `Volume` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci