#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1 vagrant-ubuntu-22.test vagrant-ubuntu-22.test localhost" | sudo tee -a /etc/hosts
echo "::1       vagrant-ubuntu-22.test vagrant-ubuntu-22.test localhost" | sudo tee -a /etc/hosts
echo "10.0.2.22 vagrant-ubuntu-22.test vagrant-ubuntu-22.test localhost" | sudo tee -a /etc/hosts

# Update packages:
sudo apt-get update
# sudo apt-get upgrade

# Install nmap:
sudo apt-get install -y nmap

# Add DNS to /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Install git:
sudo apt-get install -y git

# Install zip:
sudo apt-get install -y zip unzip

# Install net-tools:
sudo apt install -y net-tools

# Install docker:
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker run hello-world

# uninstalling the needrestart package:
sudo apt remove needrestart -y

# PHP install:
#sudo apt install php -y
#sudo apt install php-cli unzip -y
#sudo apt install php-curl -y
#sudo apt install php-gd -y
#sudo apt install php-bcmath -y
#sudo apt install -y php-dev # This library required to compile PHP modules.
#sudo apt install php-intl -y
#sudo apt install php-amqp -y
#sudo apt install php-pgsql -y
#sudo apt install php-mbstring -y
#sudo apt install php-zip -y
#sudo apt install php-redis -y
#php -v
#php -m

# Install composer:
#cd /tmp/
#curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
#composer -V

# Install symfony CLI:
#curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
#sudo apt install symfony-cli -y
#symfony -v

# Install nodjs & npm:
#sudo apt install nodejs -y
#sudo apt install npm -y

# Install aws cli:
sudo apt install awscli -y
aws --version

# Install docker-compose:
sudo apt-get install docker-compose -y
docker-compose -v

# Setup docker user permissions:
sudo groupadd docker
#sudo usermod -aG docker ${USER}
sudo usermod -aG docker ubuntu
sudo usermod -aG docker vagrant

# Inform about finish:
echo "+-------------------------------------+"
echo "|                                     |"
echo "|      Vagrant setup completed        |"
echo "|                                     |"
echo "+-------------------------------------+"
