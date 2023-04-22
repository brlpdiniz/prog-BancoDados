USE RA2017208552

-- Backup da base de dados
BACKUP DATABASE RA2017208552
   TO DISK ='./var/opt/mssql/data/RA2017208552_F_07032023.bak'

-- Restaura base de dados
RESTORE DATABASE RA2017208552
   FROM DISK ='./var/opt/mssql/data/RA2017208552_F_07032023.bak'
   
-- Backup da base de dados (DIFFERENTIAL = Backup somente com as alterações em relação ao backup anterior)
BACKUP DATABASE RA2017208552
   TO DISK ='./var/opt/mssql/data/RA2017208552_D_07032023.bak'
   WITH DIFFERENTIAL

-- Restaura base de dados full
RESTORE DATABASE RA2017208552
   FROM DISK ='./var/opt/mssql/data/RA2017208552_F_07032023.bak'
   WITH NORECOVERY

-- Restaura base de dados differential
RESTORE DATABASE RA2017208552
   FROM DISK ='./var/opt/mssql/data/RA2017208552_D_07032023.bak'
   WITH RECOVERY