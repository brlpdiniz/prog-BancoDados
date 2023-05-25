# Passo a passo - VM
1º Subir a VM com a ISO
2º 

## Reseta IP
sudo dhclient -r
sudo dhclient
id addr

## Starta o serviço
sudo systemctl start ssh
sudo systemctl status ssh

## Conecta no banco
ssh bitnami@10.10.25.152

## Manda uma cópia do arquivo da máquina atual p/ VM
scp Students.csv bitnami@10.10.25.152:/home/bitnami

## Lista diretório
hdfs dfs -ls /user

## Exclui arquivo
hdfs dfs -rm /user/Students.csv

## Cria diretório
hdfs dfs -mkdir /user/PDB

## Insere arquivo dentro da pasta criada
hdfs dfs -put Students.csv /user/PDB

## Lista o conteúdo do arquivo
hdfs dfs -cat /user/PDB/Students.csv