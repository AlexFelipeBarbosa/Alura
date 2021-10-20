USE SUCOS_VENDAS;
GO

DECLARE @nome VARCHAR(200),
        @endereco VARCHAR(MAX);

DECLARE cursor1 CURSOR FOR
SELECT c.NOME,
       (c.[ENDERECO 1] + ' - ' + c.BAIRRO + ' - ' + c.CIDADE + ' - ' + c.ESTADO + ' - ' + c.CEP) EnderecoCompleto
FROM dbo.[TABELA DE CLIENTES] c;

OPEN cursor1;
FETCH NEXT FROM cursor1
INTO @nome,
     @endereco;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @nome + ' - Endereço: ' + @endereco;
    FETCH NEXT FROM cursor1
    INTO @nome,
         @endereco;

END;

CLOSE cursor1;
DEALLOCATE cursor1;