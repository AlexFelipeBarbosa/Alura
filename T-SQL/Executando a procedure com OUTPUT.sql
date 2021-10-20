USE SUCOS_VENDAS; 
GO 
DECLARE @numero_notas INT, 
        @faturamento FLOAT, 
        @cpf VARCHAR(12), 
        @ano INT; 
SET @cpf = '8502682733'; 
SET @ano = 2016; 
EXEC RetornaValores @cpf = @cpf, 
                    @ano = @ano, 
                    @num_notas = @numero_notas OUTPUT, 
                    @faturamento = @faturamento OUTPUT; 
SELECT @numero_notas, @faturamento