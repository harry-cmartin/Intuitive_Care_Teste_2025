


show variables like 'local_infile';
SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'secure_file_priv';

-- Colocar os arquivos dos últimos 2 anos do repositório 
-- público https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/  e  
-- Dados cadastrais das Operadoras Ativas na ANS no formato CSV em 
-- https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/  baixados 
-- no diretorio apontado pelo comando acima ou desativar o 
-- secure_file_priv no my.ini presente geralmente por padrão em C:\ProgramData\MySQL\MySQL Server 8.0

-- 3.3

create DATABASE IF NOT EXISTS teste_estagio;

USE teste_estagio;

CREATE TABLE IF NOT EXISTS OPERADORAS_SAUDE (
    registro_ans INT NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_Social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100) NOT NULL,
    logradouro VARCHAR(255),
    numero varchar(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(10) NOT NULL,
    ddd CHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255) NOT NULL,
    cargo_representante VARCHAR(100),
    regiao_de_comercializacao char(1) ,
    data_registro_ans DATE NOT NULL,
    
    constraint OPERADORAS_SAUDE_PK PRIMARY KEY (registro_ans)
    
    
)Engine = InnoDB;

CREATE TABLE FINANCEIRO (
	reg_ans INT NOT NULL,
    data_op DATE,
    cd_conta_contabil VARCHAR(50),
    descricao TEXT,
    vl_saldo_inicial DECIMAL(15,2),
    vl_saldo_final DECIMAL(15,2)

)Engine =InnoDB;





