USE SUCOS_VENDAS
GO

--> Produto Aleatorio
DECLARE @ProdutoAleatorio VARCHAR(12),
        @ValorInicial INT = 1,
        @ValorFinal INT,
        @Aleatorio INT,
        @Contador INT = 1;

SELECT @ValorFinal = COUNT(*)
FROM dbo.[TABELA DE PRODUTOS];
SET @Aleatorio = dbo.NumeroAleatorio(@ValorInicial, @ValorFinal);

DECLARE cursor1 CURSOR FOR SELECT [CODIGO DO PRODUTO] FROM dbo.[TABELA DE PRODUTOS];
OPEN cursor1;
FETCH NEXT FROM cursor1
INTO @ProdutoAleatorio;
WHILE @Contador < @Aleatorio
BEGIN

    FETCH NEXT FROM cursor1
    INTO @ProdutoAleatorio;
    SET @Contador += 1;
END;

CLOSE cursor1;
DEALLOCATE cursor1;

SELECT @ProdutoAleatorio;