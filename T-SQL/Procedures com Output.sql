USE SUCOS_VENDAS; 
GO 
ALTER PROCEDURE RetornaValores 
    @cpf AS VARCHAR(12), 
    @ano AS INT, 
    @num_notas AS INT OUTPUT, 
    @faturamento AS FLOAT OUTPUT 
AS 
BEGIN 
    SELECT @num_notas = COUNT(1) 
    FROM dbo.[NOTAS FISCAIS] 
    WHERE CPF = @cpf 
          AND YEAR(DATA) = @ano; 
    SELECT @faturamento = ROUND(SUM(QUANTIDADE * PREÇO), 2) 
    FROM dbo.[ITENS NOTAS FISCAIS] b 
        INNER JOIN dbo.[NOTAS FISCAIS] a 
            ON a.NUMERO = b.NUMERO 
    WHERE CPF = @cpf 
          AND YEAR(DATA) = @ano; 
END;