#Obs: Por padrão tudo já roda como SUDO
#Copiando a chate para a raiz da maquina virtual
cp /configs/id_rsa.pub .
#Cat para pegar o conteudo/texto da chave e passar para o arquivo "authorized_keys"
cat id_rsa.pub >> .ssh/authorized_keys
#Atualizando os pacotes
sudo apt-get update
#Baixar Nginx
sudo apt-get install -y nginx
#Baixando o netstat
sudo apt-get install -y net-tools
#Baixando MySQL 5.7
#sudo apt-get install -y mysql-server-5.7
#Baixando o mariadb 10.5
sudo apt-get install -y mariadb-server-10.5
#Entrar e criar um usuario no MySQL
sudo mysql -e "CREATE USER 'phpuser'@'%' IDENTIFIED BY 'pass';"
#Obs: >> è para adicionar um conteudo/texto a um arquivo, e o > para substituir.
#Aqui eu estou passando da minha "Synced Folder" para o arquivo na minha maquina virtual a alteração do mesmo.
sudo cat /configs/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf
#Reiniciando o MySQL
sudo service mysql restart