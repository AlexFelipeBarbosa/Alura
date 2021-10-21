USE SUCOS_VENDAS;
GO

ALTER FUNCTION EntidadeAleatoria
(
    @Tipo VARCHAR(12)
)
RETURNS VARCHAR(20)
AS
BEGIN

    DECLARE @EntidadeAleatorio VARCHAR(12);
    DECLARE @Tabela TABLE
    (
        Codigo VARCHAR(20)
    );

    IF @Tipo = 'CLIENTE'
    BEGIN
        INSERT INTO @Tabela
        (
            Codigo
        )
        SELECT CPF AS Codigo
        FROM dbo.[TABELA DE CLIENTES];
    END;

    ELSE IF @Tipo = 'VENDEDOR'
    BEGIN
        INSERT INTO @Tabela
        (
            Codigo
        )
        SELECT MATRICULA AS Codigo
        FROM dbo.[TABELA DE VENDEDORES];
    END;

    ELSE IF @Tipo = 'PRODUTO'
    BEGIN
        INSERT INTO @Tabela
        (
            Codigo
        )
        SELECT [CODIGO DO PRODUTO] AS Codigo
        FROM dbo.[TABELA DE PRODUTOS];
    END;


    DECLARE @ValorInicial INT = 1,
            @ValorFinal INT,
            @Aleatorio INT,
            @Contador INT = 1;


    SELECT @ValorFinal = COUNT(*)
    FROM @Tabela;
    SET @Aleatorio = dbo.NumeroAleatorio(@ValorInicial, @ValorFinal);

    DECLARE cursor1 CURSOR FOR SELECT Codigo FROM @Tabela;
    OPEN cursor1;
    FETCH NEXT FROM cursor1
    INTO @EntidadeAleatorio;
    WHILE @Contador < @Aleatorio
    BEGIN

        FETCH NEXT FROM cursor1
        INTO @EntidadeAleatorio;
        SET @Contador += 1;
    END;

    CLOSE cursor1;
    DEALLOCATE cursor1;

    RETURN @EntidadeAleatorio;

END;



SELECT [dbo].[EntidadeAleatoria]('VENDEDOR');
SELECT [dbo].[EntidadeAleatoria]('PRODUTO');
SELECT [dbo].[EntidadeAleatoria]('CLIENTE');