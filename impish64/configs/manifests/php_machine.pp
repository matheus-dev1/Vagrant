#Basicamente isto executa o comando: "apt-get update"
#Nomeamos a nossa execução de "apt-update"
exec { 'apt-update-var':
  #Temos que passar o caminho completo do comandos que iremos rodar.
  command => '/usr/bin/apt-get update'
}

#Aqui em "package", nos definimos os pacotes que queremos instalar, o nome especifico.
package { ['php8.0', 'php8.0-mysql'] :
  #Precisa executar o comando da varaivel "apt-update-var" antes de instalar os pacotes.
  require => Exec['apt-update-var'],
  #E garante que estão instalados.
  ensure => installed,
}

exec { 'run-php8':
  #Precisa deste pacote intalado antes de executar o comando.
  require => Package['php8.0'],
  #Aqui eu vou executar um servidor PHP no arquivo index.php que está na Synced Folder.
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
}
