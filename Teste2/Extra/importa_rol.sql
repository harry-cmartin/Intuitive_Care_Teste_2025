
-- EXTRA: Importar dados da extração da tabela PDF do ANEXO_1 para um banco de dados para visualização ou teste 

CREATE DATABASE IF NOT EXISTS intuitive_care_teste;
USE intuitive_care_teste;

show variables like 'local_infile';
SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'secure_file_priv';
-- Colocar arquivo Rol_de_Procedimentos.csv no diretorio apontado pelo comando acima ou desativar o 
-- secure_file_priv no my.ini presente geralmente por padrão em C:\ProgramData\MySQL\MySQL Server 8.0

CREATE TABLE IF NOT EXISTS rol_procedimentos (
    procedimento TEXT,
    rn_alteracao TEXT,
    vigencia TEXT,
    seg_odontologica VARCHAR(100),
    seg_ambulatorial VARCHAR(100),
    hco VARCHAR(100),
    hso VARCHAR(100),
    ref VARCHAR(100),
    pac VARCHAR(100),
    dut VARCHAR(100),
    subgrupo TEXT,
    grupo TEXT,
    capitulo TEXT
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Rol_de_Procedimentos.csv'
INTO TABLE rol_procedimentos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    @procedimento,
    @rn_alteracao,
    @vigencia,
    @seg_odontologica,
    @seg_ambulatorial,
    @hco,
    @hso,
    @ref,
    @pac,
    @dut,
    @subgrupo,
    @grupo,
    @capitulo
)
SET	
	procedimento = NULLIF(TRIM(@procedimento), ''),
    rn_alteracao = NULLIF(TRIM(@rn_alteracao), ''),
    vigencia = NULLIF(TRIM(@vigencia), ''),
    seg_odontologica = NULLIF(TRIM(@seg_odontologica), ''),
    seg_ambulatorial = NULLIF(TRIM(@seg_ambulatorial), ''),
    hco = NULLIF(TRIM(@hco), ''),
    hso = NULLIF(TRIM(@hso), ''),
    ref = NULLIF(TRIM(@ref), ''),
    pac = NULLIF(TRIM(@pac), ''),
    dut = NULLIF(TRIM(@dut), ''),
    subgrupo = NULLIF(TRIM(@subgrupo), ''),
    grupo = NULLIF(TRIM(@grupo), ''),
    capitulo = NULLIF(TRIM(@capitulo), '');


