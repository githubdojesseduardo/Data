SHOW VARIABLES LIKE 'max_connections';

SHOW STATUS WHERE variable_name = 'Threads_connected';

SHOW PROCESSLIST;

KILL 11

SET GLOBAL max_connections = 151;