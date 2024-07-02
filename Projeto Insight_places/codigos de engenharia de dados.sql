'Adicionar Colunas: Permite adicionar uma ou mais colunas a uma tabela existente. 
Isso é útil quando novos tipos de informação
precisam ser armazenados para registros existentes.'
ALTER TABLE tabela ADD COLUMN nova_coluna TIPO_DE_DADO;


'Eliminar Colunas: Remove uma ou mais colunas de uma tabela. 
Essencial para quando certos dados não são mais necessários.'
ALTER TABLE tabela DROP COLUMN coluna;


'Modificar Colunas: Altera o tipo de dados,
o tamanho ou outras propriedades de uma coluna existente.
Isso é frequentemente usado para otimizar o armazenamento de dados
ou corrigir estruturas de dados inadequadas.'
ALTER TABLE tabela MODIFY COLUMN coluna NOVO_TIPO_DE_DADO; 


'Renomear Colunas: Muda o nome de uma coluna,
o que é útil para corrigir erros de digitação ou
realizar reestruturações no esquema de dados.'
ALTER TABLE tabela RENAME COLUMN coluna_atual TO nova_coluna;


'Adicionar Chaves Primárias: Insere uma chave primária em uma tabela,
o que é crucial para garantir a unicidade dos registros.'
ALTER TABLE tabela ADD PRIMARY KEY (coluna);


'Remover Chaves Primárias: Elimina a chave primária de uma tabela, 
permitindo alterações na estrutura de dados que antes eram restritas.'
ALTER TABLE tabela DROP PRIMARY KEY;


'Adicionar Índices: Cria um índice em uma ou mais colunas
para melhorar a performance de consultas.'
ALTER TABLE tabela ADD INDEX nome_do_indice (coluna);


'Eliminar Índices: Remove índices existentes, 
o que pode ser necessário durante otimizações
ou reestruturações de tabelas.'
ALTER TABLE tabela DROP INDEX nome_do_indice;


'Mudar o Tipo de Tabela: Altera o mecanismo de armazenamento da tabela 
(por exemplo, de MyISAM para InnoDB), 
o que pode afetar a performance, 
a integridade transacional e o suporte a chaves estrangeiras.'
ALTER TABLE tabela ENGINE = InnoDB;


'Adicionar Chaves Estrangeiras: Define relações entre tabelas,
essenciais para manter a integridade referencial dos dados.'
ALTER TABLE tabela ADD CONSTRAINT fk_nome_da_chave FOREIGN KEY (coluna) REFERENCES outra_tabela (coluna);


'Modificar Opções de Tabela: Permite alterar várias configurações da tabela, 
como o conjunto de caracteres e o collation.'
ALTER TABLE tabela CONVERT TO CHARACTER SET charset_name COLLATE collation_name;





ALTER TABLE tabela ENGINE = InnoDB;'