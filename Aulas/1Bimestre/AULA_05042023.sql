USE RA2017208552
--SELECT * FROM FUNCIONARIOS
--SELECT * FROM DEPENDENTES  

--CREATE TABLE FUNC_COM_DEP (ID_FUNCIONARIO INT)
--SELECT * FROM FUNC_COM_DEP

DECLARE @Cod INT;
DECLARE @Nome VARCHAR(200);
DECLARE @NumDep INT;

DECLARE Cur_Funcionarios CURSOR FOR 
   SELECT * 
      FROM FUNCIONARIOS;

OPEN Cur_Funcionarios;

FETCH NEXT FROM Cur_Funcionarios 
   INTO @Cod, @Nome;

WHILE @@FETCH_STATUS = 0
BEGIN
   
   SET @NumDep = 0
   
   -- Obtendo o numero de dependentes
   -- DQL
   SELECT @NumDep = COUNT(*)
      FROM DEPENDENTES  
     WHERE ID_FUNCIONARIO = @Cod;

   -- Se funcionario tem dependentes, inserer na tabela correspondentes
   IF @NumDep > 0
      -- DML
      INSERT INTO FUNC_COM_DEP
         VALUES (@Cod);

   PRINT 'Codigo: '+CONVERT(varchar, @Cod)+
         ' Nome: '+@Nome+ 
         ' Tot Dep: '+CONVERT(varchar, @NumDep);

   FETCH NEXT FROM Cur_Funcionarios 
      INTO @Cod, @Nome;   
END;

CLOSE Cur_Funcionarios;

DEALLOCATE Cur_Funcionarios;