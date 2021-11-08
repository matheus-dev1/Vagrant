cp /vagrant/id_rsa /home/vagrant
chmod 600 /home/vagrant/id_rsa
chown vagrant:vagrant /home/vagrant/id_rsa

sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible