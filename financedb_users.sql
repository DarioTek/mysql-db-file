SHOW GRANTS FOR 'root'@'%';


GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Dabb1234y1!';
GRANT ALL PRIVILEGES ON financedb.* TO 'roor'@'localhost';

CREATE DATABASE financedb;

CREATE USER 'finance_user'@'localhost' IDENTIFIED BY 'Dabb1234y1!';
CREATE USER 'remote_user'@'localhost' IDENTIFIED BY 'Dabb1234y1!';

GRANT ALL PRIVILEGES ON financedb.* TO 'finance_user'@'localhost';
GRANT ALL PRIVILEGES ON financedb.* TO 'remote_user'@'localhost';


GRANT ALL PRIVILEGES ON financedb.* TO 'root'@'%';
FLUSH PRIVILEGES;



FLUSH PRIVILEGES;
