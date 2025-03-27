-- Criando o banco de dados
CREATE DATABASE dados_ans;

-- Conectando ao banco de dados
\c dados_ans;

--- Comando para criar a tabela do arquivo Relatorio_cadop.
CREATE TABLE operadoras_plano_saude (
    registro_operadora TEXT PRIMARY KEY,  -- Registro da ANS 
    cnpj VARCHAR(14) NOT NULL,  -- CNPJ da operadora 
    razao_social VARCHAR(255) NOT NULL,  -- Razão Social
    nome_fantasia VARCHAR(255),  -- Nome Fantasia 
    modalidade VARCHAR(50) NOT NULL,  -- Classificação Jurídica da operadora 
    logradouro VARCHAR(100),  -- Endereço da sede 
    numero VARCHAR(20),  -- Número do endereço
    complemento VARCHAR(50),  -- Complemento do endereço
    bairro VARCHAR(50),  -- Bairro do endereço 
    cidade VARCHAR(50),  -- Cidade do endereço 
    uf VARCHAR(2),  -- Estado (UF)
    cep VARCHAR(8),  -- CEP da operadora
    ddd VARCHAR(4),  -- Código de área (DDD)
    telefone VARCHAR(20),  -- Telefone da operadora
    fax VARCHAR(20),  -- Fax da operadora
    endereco_eletronico VARCHAR(255), -- E-mail da operadora 
    representante VARCHAR(100),  -- Representante legal da operadora 
    cargo_representante VARCHAR(60),  -- Cargo do representante 
    regiao_de_comercializacao INTEGER CHECK (regiao_de_comercializacao BETWEEN 1 AND 6),  
    data_registro_ans DATE NOT NULL  -- Data do registro na ANS (AAAA-MM-DD)
);
--- Comando para criar a tabela dos arquivos da pasta arquivos.
CREATE TABLE demonstracoes_contabeis (
    id SERIAL PRIMARY KEY, -- Um id para ser a chave primaria dessa tabela
    data_operadora DATE NOT NULL,  -- Data do início do trimestre dos dados (AAAA-MM-DD)
    reg_ans VARCHAR(8) ,  -- Registro da operadora 
    cd_conta_contabil INTEGER  NOT NULL,  -- Código da conta contábil 
    descricao VARCHAR(150) NOT NULL,  -- Descrição da conta contábil
    vl_saldo_inicial DECIMAL(15,2) NOT NULL,  -- Saldo inicial 
    vl_saldo_final DECIMAL(15,2) NOT NULL  -- Saldo final 
    
);

--- Essa parte é para subir os dados dos arquivos da pasta arquivos e pasta relatorio para preencher com dados as tabelas criadas
-- Importando operadoras_plano_saude
\copy operadoras_plano_saude (registro_operadora, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, endereco_eletronico, representante, cargo_representante, regiao_de_comercializacao, data_registro_ans) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/relatorio/Relatorio_cadop.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 1T2023
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/1T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 2T2023
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/2T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 3T2023
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/3T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 4T2023
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/4T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 1T2024
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/1T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 2T2024
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/2T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 3T2024
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/3T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Importando demonstracoes_contabeis 4T2024
\copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/4T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';







