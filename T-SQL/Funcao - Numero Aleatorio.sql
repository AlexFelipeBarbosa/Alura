USE SUCOS_VENDAS;
GO


CREATE FUNCTION NumeroAleatorio
(
    @ValorInicial INT,
    @ValorFinal INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Aleatorio INT,
            @AleatorioFloat FLOAT;

    SELECT @AleatorioFloat = value
    FROM vw_Aleatorio;

    SET @Aleatorio = ROUND(((@ValorFinal - @ValorInicial - 1) * @AleatorioFloat + @ValorInicial), 0);
    RETURN @Aleatorio;
END;



SELECT [dbo].[NumeroAleatorio](1,1000)