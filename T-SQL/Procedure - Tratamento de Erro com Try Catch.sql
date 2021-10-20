USE SUCOS_VENDAS;
GO


ALTER PROCEDURE dbo.TrataErroZeroComTryCatch
    @cpf VARCHAR(12),
    @ano INT,
    @denominador INT,
    @Mensagem VARCHAR(50) OUTPUT
AS
BEGIN

    BEGIN TRY

        SELECT ROUND(SUM(a.QUANTIDADE * a.[PREÇO]), 2) AS Faturamento,
               ROUND(SUM(a.QUANTIDADE * a.[PREÇO]), 2) / @denominador AS Comissao
        FROM dbo.[ITENS NOTAS FISCAIS] a
            INNER JOIN dbo.[NOTAS FISCAIS] b
                ON a.NUMERO = b.NUMERO
        WHERE b.CPF = @cpf
              AND YEAR(b.DATA) = @ano;

    END TRY
    BEGIN CATCH

        SET @Mensagem = 'Houve um Erro número: ' + CONVERT(VARCHAR(10), @@ERROR);

    END CATCH;

END;