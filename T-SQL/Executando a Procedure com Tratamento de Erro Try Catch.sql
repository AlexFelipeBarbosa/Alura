USE SUCOS_VENDAS;
GO

DECLARE @denominador INT = 0,
        @cpf VARCHAR(12) = '1471156710',
        @ano INT = 2016,
        @Mensagem VARCHAR(30) = '';



EXEC dbo.TrataErroZeroComTryCatch @cpf = @cpf,
                                  @ano = @ano,
                                  @denominador = @denominador,
                                  @Mensagem = @Mensagem OUTPUT;


IF @Mensagem <> ''
    PRINT @Mensagem;