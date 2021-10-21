USE SUCOS_VENDAS;
GO

--> Vendedor Aleatório
DECLARE @VendedorAleatorio VARCHAR(12),
        @ValorInicial INT = 1,
        @ValorFinal INT,
        @Aleatorio INT,
        @Contador INT = 1;

SELECT @ValorFinal = COUNT(*)
FROM dbo.[TABELA DE VENDEDORES];
SET @Aleatorio = dbo.NumeroAleatorio(@ValorInicial, @ValorFinal);

DECLARE cursor1 CURSOR FOR SELECT MATRICULA FROM dbo.[TABELA DE VENDEDORES];
OPEN cursor1;
FETCH NEXT FROM cursor1
INTO @VendedorAleatorio;
WHILE @Contador < @Aleatorio
BEGIN

    FETCH NEXT FROM cursor1
    INTO @VendedorAleatorio;
    SET @Contador += 1;
END;

CLOSE cursor1;
DEALLOCATE cursor1;

SELECT @VendedorAleatorio;