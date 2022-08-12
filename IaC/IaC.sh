echo "Limpando pasta/Cleaning folders"
sudo rm -rf /publico /adm /ven /sec

echo "Excluindo Usu�rios/Remove users"
sudo userdel carlos 
sudo userdel maria
sudo userdel joao
sudo userdel debora
sudo userdel sebastiana
sudo userdel roberto
sudo userdel josefina
sudo userdel amanda
sudo userdel rogerio

echo "Excluindo Grupos/Remove groups"
sudo groupdel GRP_ADM 
sudo groupdel GRP_VEN 
sudo groupdel GRP_SEC

echo "Criando Grupoos/Create groups"
sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

echo "Criando Usu�rios/Create users"
sudo useradd carlos     -c "Carlos Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd maria      -c "Maria Brasil"      -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd joao       -c "Joao Brasil"       -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd debora     -c "Debora Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd sebastiana -c "Sebastiana Brasil" -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd roberto    -c "Roberto Brasil"    -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd josefina   -c "Josefina Brasil"   -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 
sudo useradd amanda     -c "Amanda Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 
sudo useradd rogerio    -c "Rogerio Brasil"    -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 

echo "Criando diret�rios/Create folders"
sudo mkdir /publico /adm /ven /sec

echo "Alterando privil�gios/Privileges management"
sudo chmod 777 /publico
sudo chmod 770 /adm /ven /sec
sudo chown root:GRP_ADM /adm/
sudo chown root:GRP_VEN /ven/
sudo chown root:GRP_SEC /sec/