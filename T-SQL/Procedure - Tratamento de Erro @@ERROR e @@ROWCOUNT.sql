USE SUCOS_VENDAS;
GO


ALTER PROCEDURE dbo.TrataErroZero
    @cpf VARCHAR(12),
    @ano INT,
    @denominador INT,
    @NumErro INT OUTPUT,
    @NumLinha INT OUTPUT
AS
BEGIN



    SELECT ROUND(SUM(a.QUANTIDADE * a.[PREÇO]), 2) AS Faturamento,
           ROUND(SUM(a.QUANTIDADE * a.[PREÇO]), 2) / @denominador AS Comissao
    FROM dbo.[ITENS NOTAS FISCAIS] a
        INNER JOIN dbo.[NOTAS FISCAIS] b
            ON a.NUMERO = b.NUMERO
    WHERE b.CPF = @cpf
          AND YEAR(b.DATA) = @ano;

    SELECT @NumErro = @@ERROR,
           @NumLinha = @@ROWCOUNT;


END;