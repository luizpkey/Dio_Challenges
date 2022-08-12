echo 'Atualizando o servidor/Update server'
sudo apt update
sudo apt upgrade -y

echo 'Baixando pacotes/Install Packs'
apt install apache2 unzip -y

echo 'Baixando aplicação/App download'
rm /tmp/main.zip
cd /tmp && wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip && unzip main.zip

echo 'Copiando arquivos/Destinatio files'
sudo cp -r /tmp/linux-site-dio-main/* /var/www/html/

echo 'Reiniciando serviço/Restart : Apache'
sudo systemctl restart apache2