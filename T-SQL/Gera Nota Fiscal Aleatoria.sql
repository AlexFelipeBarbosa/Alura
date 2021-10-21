USE SUCOS_VENDAS;
GO


DECLARE @Cliente VARCHAR(12),
        @Vendedor VARCHAR(12),
        @Produto VARCHAR(12),
        @Data DATE,
        @Numero INT,
        @Imposto FLOAT = 0.18,
        @NumItens INT,
        @Contador INT = 1,
        @Quantidade INT,
        @Preco FLOAT,
        @AuxProduto INT;

DECLARE @ListaProdutos TABLE
(
    Produto VARCHAR(20)
);


SET @Data = '2021-10-20';
SET @Cliente = [dbo].[EntidadeAleatoria]('CLIENTE');
SET @Vendedor = [dbo].[EntidadeAleatoria]('VENDEDOR');

SELECT @Numero = MAX(NUMERO) + 1
FROM dbo.[NOTAS FISCAIS];

SET @NumItens = [dbo].[NumeroAleatorio](2, 10);


INSERT INTO dbo.[NOTAS FISCAIS]
(
    CPF,
    MATRICULA,
    DATA,
    NUMERO,
    IMPOSTO
)
VALUES
(   @Cliente,  -- CPF - varchar(11)
    @Vendedor, -- MATRICULA - varchar(5)
    @Data,     -- DATA - date
    @Numero,   -- NUMERO - int
    @Imposto   -- IMPOSTO - float
    );

WHILE @Contador <= @NumItens
BEGIN
    
    SET @Produto = [dbo].[EntidadeAleatoria]('PRODUTO');

    SELECT @AuxProduto = COUNT(*)
    FROM @ListaProdutos
    WHERE Produto = @Produto;

    IF (@AuxProduto = 0)
    BEGIN

        SET @Quantidade = [dbo].[NumeroAleatorio](2, 100);

        SELECT @Preco = [PREÇO DE LISTA]
        FROM dbo.[TABELA DE PRODUTOS]
        WHERE [CODIGO DO PRODUTO] = @Produto;

        INSERT INTO dbo.[ITENS NOTAS FISCAIS]
        (
            NUMERO,
            [CODIGO DO PRODUTO],
            QUANTIDADE,
            PREÇO
        )
        VALUES
        (   @Numero,     -- NUMERO - int
            @Produto,    -- CODIGO DO PRODUTO - varchar(10)
            @Quantidade, -- QUANTIDADE - int
            @Preco       -- PREÇO - float
            );

        SET @Contador += @Contador;
    END;

    INSERT INTO @ListaProdutos
    (
        Produto
    )
    VALUES
    (@Produto -- Produto - varchar(20)
        );		
END;

