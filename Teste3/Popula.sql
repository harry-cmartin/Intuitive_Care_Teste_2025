

-- 3.4

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Relatorio_cadop.csv'
INTO TABLE OPERADORAS_SAUDE
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Registro_ANS, @CNPJ, @Razao_Social, @Nome_Fantasia, @Modalidade, @Logradouro, @Numero, 
 @Complemento, @Bairro, @Cidade, @UF, @CEP, @DDD, @Telefone, @Fax, 
 @Endereco_eletronico, @Representante, @Cargo_Representante, 
 @Regiao_de_Comercializacao, @Data_Registro_ANS) 
SET 
    registro_ANS = @Registro_ANS,
    cnpj = @CNPJ,
    razao_social = @Razao_Social,
    nome_fantasia = @Nome_Fantasia,
    modalidade = @Modalidade,
    logradouro = @Logradouro,
    numero = @Numero,
    complemento = @Complemento,
    bairro = @Bairro,
    cidade = @Cidade,
    uf = @UF,
    cep = @CEP,
    ddd = @DDD,
    telefone = @Telefone,
    fax = @Fax,
    endereco_eletronico = @Endereco_eletronico,
    representante = @Representante,
    cargo_representante = @Cargo_Representante,
    regiao_de_comercializacao = @Regiao_de_Comercializacao,
    data_registro_ans = @Data_Registro_ANS; 

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\1T2023.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\2t2023.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\3T2023.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\1T2024.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\2T2024.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\3T2024.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\4T2024.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = @DATA,
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\4T2023.csv'
INTO TABLE FINANCEIRO
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL , @VL_SALDO_FINAL)
SET
	reg_ans = @REG_ANS,
    data_op = STR_TO_DATE(@DATA, '%d/%m/%Y'),
    cd_conta_contabil = @CD_CONTA_CONTABIL,
    descricao = @DESCRICAO,
    vl_saldo_inicial = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
	vl_saldo_final = REPLACE(@VL_SALDO_FINAL, ',', '.');
    


