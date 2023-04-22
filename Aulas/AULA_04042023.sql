USE RA2017208552

-- Declara, atribui e utiliza uma variavel
DECLARE @nome VARCHAR(200)
SET @nome = 'Professor'
PRINT 'Nome: '+@nome    -- Concatenação

-- BEGIN E END SAO OS {} DA LINGUAGEM C
IF @nome = 'Professor'
BEGIN
  HILE
END
ELSE
BEGIN
  PRINT 'Nome: '+@nome
END

-- CALCULO DO IMC
-- IMC = Massa / (Altura*Altura)

DECLARE @massa FLOAT
SET @massa = 68.5

DECLARE @altura FLOAT
SET @altura = 1.73

DECLARE @imc FLOAT
SET @imc = @massa = (@altura*@altura)

IF (@imc <= 16)
BEGIN
  PRINT 'Magreza grave'
END
ELSE
BEGIN
  IF (@imc >= 16) AND (@imc <= 16,9)
  BEGIN
    PRINT 'Muito abaixo do peso'
  END
  ELSE
  BEGIN
    IF (@imc >= 17) AND (@imc <= 18,4)
    BEGIN
      PRINT 'Abaixo do peso'
    END
    ELSE
    BEGIN
      IF (@imc >= 18,5) AND (@imc <= 24,9)
      BEGIN
        PRINT 'Peso normal'
      END
      ELSE
      BEGIN
        IF (@imc >= 25) AND (@imc <= 29)
        BEGIN
          PRINT 'Acima do peso'
        END
        ELSE
        BEGIN
          IF (@imc >= 30) AND (@imc <= 35)
          BEGIN
            PRINT 'Obesidade Grau I'
          END
          ELSE
          BEGIN
            PRINT 'Obesidade Grau II'
          END
        END
      END
    END
  END  
END


-- ROLLBACK TRAN

USE RA2017208552

SELECT * FROM FUNCIONARIOS

BEGIN TRAN
    INSERT INTO FUNCIONARIOS
        VALUES (5, 'MARCIO')

    INSERT INTO FUNCIONARIOS
        VALUES (6, 'HELIO HUGO')
COMMIT TRAN