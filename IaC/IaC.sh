sudo rm -rf /publico /adm /ven /sec
pause
sudo userdel -r carlos 
sudo userdel -r maria
sudo userdel -r joao
sudo userdel -r debora
sudo userdel -r sebastiana
sudo userdel -r roberto
sudo userdel -r josefina
sudo userdel -r amanda
sudo userdel -r rogerio
sudo groupdel GRP_ADM 
sudo groupdel GRP_VEN 
sudo groupdel GRP_SEC

sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC
sudo useradd carlos     -c "Carlos Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd maria      -c "Maria Brasil"      -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd joao       -c "Joao Brasil"       -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_ADM 
sudo useradd debora     -c "Debora Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd sebastiana -c "Sebastiana Brasil" -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd roberto    -c "Roberto Brasil"    -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_VEN 
sudo useradd josefina   -c "Josefina Brasil"   -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 
sudo useradd amanda     -c "Amanda Brasil"     -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 
sudo useradd rogerio    -c "Rogerio Brasil"    -s /bin/bash -p $(openssl passwd -crypt 123mudar) -G GRP_SEC 
sudo mkdir /publico /adm /ven /sec
sudo chmod 777 /publico
sudo chmod 770 /adm /ven /sec
sudo chown root:GRP_ADM /adm/
sudo chown root:GRP_VEN /ven/
sudo chown root:GRP_SEC /sec/