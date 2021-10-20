USE SUCOS_VENDAS;
GO

DECLARE @denominador INT = 0,
        @cpf VARCHAR(12) = '1471156710',
        @ano INT = 2016,
        @NumErro INT,
        @NumLinha INT;


EXEC dbo.TrataErroZero @cpf = @cpf,
                       @ano = @ano,
                       @denominador = @denominador,
                       @NumErro = @NumErro OUTPUT,
                       @NumLinha = @NumLinha OUTPUT;

IF @NumErro <> 0
    PRINT 'Houve um Erro: ' + CONVERT(VARCHAR(10), @NumErro) + ' - ' + CONVERT(VARCHAR(10), @NumLinha);