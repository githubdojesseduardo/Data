SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';
SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

SHOW VARIABLES LIKE 'tmp_table_size';
SHOW VARIABLES LIKE 'max_heap_table_size';

SET GLOBAL tmp_table_size = 1024; -- diminuindo o tamanho das variaveis de tabela temporarária
SET GLOBAL max_heap_table_size = 17000