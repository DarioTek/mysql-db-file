CREATE USER 'hbstudent'@'localhost' IDENTIFIED BY 'hbstudent';

GRANT ALL PRIVILEGES ON *.* TO 'finance_user'@'localhost';

GRANT ALL PRIVILEGES ON financedb.* TO 'finance_user'@'localhost';

FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON * . * TO 'hbstudent'@'localhost';

#
# Starting with MySQL 8.0.4, the MySQL team changed the 
# default authentication plugin for MySQL server 
# from mysql_native_password to caching_sha2_password.
#
# The command below will make the appropriate updates for your user account.
#
# See the MySQL Reference Manual for details: 
# https://dev.mysql.com/doc/refman/8.0/en/caching-sha2-pluggable-authentication.html
#
ALTER USER 'hbstudent'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hbstudent';


CREATE DATABASE financedb;
CREATE USER 'finance_user'@'localhost' IDENTIFIED BY 'Dabb1234y1!';

GRANT ALL PRIVILEGES ON financedb.* TO 'finance_user'@'localhost';

FLUSH PRIVILEGES;

select user, host from mysql.db where Db = 'financedb';

select user, host from mysql.tables_priv where db = 'financedb';

SELECT User, Host FROM mysql.user;
