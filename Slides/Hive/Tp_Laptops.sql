CREATE EXTERNAL TABLE IF NOT EXISTS Tp_Laptops(
   Tp_LaptopID INT,
   Descricao STRING)
COMMENT 'Tp Laptops Names'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

DESCRIBE Tp_Laptops;

LOAD DATA INPATH '/user/arquivos/Tp_Laptops.csv' INTO TABLE Tp_Laptops;

SELECT * FROM Tp_Laptops LIMIT 10;

SELECT s.StudentID,
       s.FirstName, 
       s.Title,
       s.State,
       t.Tp_LaptopID,
       t.Descricao
  FROM Students s 
INNER JOIN Tp_Laptops t 
        ON (s.Tp_Laptop = t.Tp_LaptopID);
