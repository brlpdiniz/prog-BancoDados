-- Executa o procedimento armazenado
--EXEC LISTA_FUNC_DEPENDENTES 1, 0

-- Apaga procedimento
DROP PROCEDURE LISTA_FUNC_DEPENDENTES
GO

-- Cria procedinento
CREATE PROCEDURE LISTA_FUNC_DEPENDENTES 
   @LIM_DEP INT,
   @TP_DEP INT
AS
BEGIN
   
   DECLARE @Cod INT;
   DECLARE @NumDep INT;
   
   -- Apaga tabela de funcionarios com dependentes
   DELETE FROM FUNC_COM_DEP;
   
   DECLARE Cur_Funcionarios CURSOR FOR 
      SELECT CODIGO
         FROM FUNCIONARIOS;
 
   OPEN Cur_Funcionarios;
   
   FETCH NEXT FROM Cur_Funcionarios 
      INTO @Cod;
   
   WHILE @@FETCH_STATUS = 0
   BEGIN
   
      SET @NumDep = 0
      
      -- Obtendo o numero de dependentes
      SELECT @NumDep = COUNT(*)
        FROM DEPENDENTES  
       WHERE ID_FUNCIONARIO = @Cod
         AND (TP_DEPENDENTE = @TP_DEP 
          OR @TP_DEP = 0);
      
      -- Se funcionario tem dependentes, inserer na tabela correspondentes
      IF @NumDep >= @LIM_DEP
         INSERT INTO FUNC_COM_DEP
            VALUES (@Cod);

      FETCH NEXT FROM Cur_Funcionarios 
         INTO @Cod;
      
   END
   
   CLOSE Cur_Funcionarios;
   
   DEALLOCATE Cur_Funcionarios;
   
   -- Lista resultados
   SELECT * 
      FROM FUNC_COM_DEP

END
GO