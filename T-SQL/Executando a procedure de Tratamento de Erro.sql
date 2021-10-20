USE SUCOS_VENDAS;
GO

DECLARE @denominador INT = 0,
        @cpf VARCHAR(12) = '1471156710',
        @ano INT = 2016,
        @mensagem VARCHAR(MAX) = '';

EXEC [dbo].[TrataErroZeroComTryCatch2] @cpf = @cpf,
                                       @ano = @ano,
                                       @denominador = @denominador,
                                       @mensagem = @mensagem OUTPUT;

IF @mensagem <> ''
PRINT @mensagem

-- Houve um Erro número: 8134 -  Mensagem: Divide by zero error encountered. -  Grau de Severidade do erro: 16 -  Estado do erro: 1 -  Numero da Linha: 12 -  Procedure: dbo.TrataErroZeroComTryCatch2
