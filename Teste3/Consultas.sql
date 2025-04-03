

-- 3.5

-- Quais as 10 operadoras com maiores despesas em "EVENTOS/ SINISTROS CONHECIDOS OU 
-- AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre? 

SELECT 
    o.cnpj, 
    o.razao_social, 
    SUM(f.vl_saldo_final - f.vl_saldo_inicial) AS total_despesas
FROM FINANCEIRO f
JOIN OPERADORAS_SAUDE o ON f.reg_ans = o.registro_ans
WHERE 
    f.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
    AND f.data_op = '2024-10-01' 
GROUP BY o.registro_ans, o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

-- Quais as 10 operadoras com maiores despesas nessa categoria no último ano?

SELECT 
    o.cnpj, 
    o.razao_social, 
    SUM(f.vl_saldo_final - f.vl_saldo_inicial) AS total_despesas
FROM FINANCEIRO f
JOIN OPERADORAS_SAUDE o ON f.reg_ans = o.registro_ans
WHERE 
    f.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
    AND f.data_op > '2023-10-01' 
GROUP BY o.registro_ans, o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;
