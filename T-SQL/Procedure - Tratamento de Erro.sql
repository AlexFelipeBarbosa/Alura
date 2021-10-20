USE [SUCOS_VENDAS];
GO

ALTER PROCEDURE [dbo].[TrataErroZeroComTryCatch2]
    @cpf VARCHAR(12),
    @ano INT,
    @denominador INT,
    @Mensagem VARCHAR(MAX) OUTPUT
AS
BEGIN

    BEGIN TRY

        SELECT ROUND(SUM(a.QUANTIDADE * a.[PREÇO]), 2) AS Faturamento,
               ROUND(SUM(a.QUANTIDADE * a.[PREÇO]) / @denominador, 2) AS Comissao
        FROM dbo.[ITENS NOTAS FISCAIS] a
            INNER JOIN dbo.[NOTAS FISCAIS] b
                ON a.NUMERO = b.NUMERO
        WHERE b.CPF = @cpf
              AND YEAR(b.DATA) = @ano;

    END TRY
    BEGIN CATCH

        SET @Mensagem = 'Houve um Erro número: ' + CONVERT(VARCHAR(10), ERROR_NUMBER()) + ' - ';
        SET @Mensagem += ' Mensagem: ' + ERROR_MESSAGE() + ' - ';
        SET @Mensagem += ' Grau de Severidade do erro: ' + CONVERT(VARCHAR(10), ERROR_SEVERITY()) + ' - ';
        SET @Mensagem += ' Estado do erro: ' + CONVERT(VARCHAR(10), ERROR_STATE()) + ' - ';
        SET @Mensagem += ' Numero da Linha: ' + CONVERT(VARCHAR(10), ERROR_LINE()) + ' - ';
        SET @Mensagem += ' Procedure: ' + ERROR_PROCEDURE();

    END CATCH;

END;
GO


