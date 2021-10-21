USE SUCOS_VENDAS;
GO

--> Cliente Aleatório
DECLARE @ClienteAleatorio VARCHAR(12),
        @ValorInicial INT = 1,
        @ValorFinal INT,
        @Aleatorio INT,
        @Contador INT = 1;

SELECT @ValorFinal = COUNT(*)
FROM dbo.[TABELA DE CLIENTES];
SET @Aleatorio = dbo.NumeroAleatorio(@ValorInicial, @ValorFinal);

DECLARE cursor1 CURSOR FOR SELECT CPF FROM dbo.[TABELA DE CLIENTES];
OPEN cursor1;
FETCH NEXT FROM cursor1
INTO @ClienteAleatorio;
WHILE @Contador < @Aleatorio
BEGIN

    FETCH NEXT FROM cursor1
    INTO @ClienteAleatorio;
    SET @Contador += 1;
END;

CLOSE cursor1;
DEALLOCATE cursor1;

SELECT @ClienteAleatorio;