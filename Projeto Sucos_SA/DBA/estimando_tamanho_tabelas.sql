CREATE TABLE `table_homologacao_dev_1` (
    `id` LONG,
    `name` varchar(255) DEFAULT NULL,
    INDEX `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `table_homologacao_dev_2` (
    `name` char(16) NOT NULL,
    `description` varchar(128) NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO table_homologacao_dev_1 values
(1, "John Doe"),
(2, "Mickey Mouse"),
(3, "Дмитрий Анатольевич Медведев"),
(4, "Jane Doe"),
(5, "Jeffrey \"The Dude\" Lebowski"),
(6, "Walter Sobchak"),
(7, "Donny Kerabatsos"),
(8, "Neo"),
(9, "Trinity"),
(10, "Morpheus");

INSERT INTO table_homologacao_dev_2 values
("Bit", "Menor pedaço de lógica binária: 0 ou 1"),
("Byte", "Consiste em oito bits"),
("Nibble", "Metade de um byte, consiste em quatro bits"),
("kB", "Quilobyte; 1.000 ou 1.024 bytes"),
("KiB", "Quilobyte; termo IEC correto para 1.024 bytes"),
("MB", "Megabyte; 1.000.000 ou 1.048.576 bytes"),
("MiB", "Mebibyte; termo IEC correto para 1.024 KiB");


SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1';

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1' AND TABLE_SCHEMA = 'sucos_vendas';

SELECT (DATA_LENGTH + INDEX_LENGTH) FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1' AND TABLE_SCHEMA = 'sucos_vendas';

SELECT (DATA_LENGTH + INDEX_LENGTH)/ (SELECT COUNT(*) FROM table_homologacao_dev_1) FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1' AND TABLE_SCHEMA = 'sucos_vendas';

SELECT 1000000 * (DATA_LENGTH + INDEX_LENGTH)/ (SELECT COUNT(*) FROM table_homologacao_dev_1) FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1' AND TABLE_SCHEMA = 'sucos_vendas';

SELECT 1000000 * (DATA_LENGTH + INDEX_LENGTH)/ (SELECT COUNT(*) FROM table_homologacao_dev_1) 
/ (1024 * 1024)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_1' AND TABLE_SCHEMA = 'sucos_vendas';


SELECT 20000 * (DATA_LENGTH + INDEX_LENGTH)/ (SELECT COUNT(*) FROM table_homologacao_dev_2) 
/ (1024 * 1024)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'table_homologacao_dev_2' AND TABLE_SCHEMA = 'sucos_vendas';