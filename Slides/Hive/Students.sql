CREATE EXTERNAL TABLE IF NOT EXISTS Students (
   StudentID INT,
   FirstName STRING, 
   Title STRING,
   State STRING, 
   Tp_Laptop INT)
COMMENT 'Student Names'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

DESCRIBE Students;

LOAD DATA INPATH '/user/arquivos/Students.csv' INTO
TABLE Students;

SELECT * FROM Students LIMIT 10;
