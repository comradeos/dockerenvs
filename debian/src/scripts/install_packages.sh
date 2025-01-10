# before installing, run chmod +x install_packages as root 
# перед встановленням запустіть chmod +x install_packages як root 
# перед установкой запустите chmod +x install_packages как root

# update package list | оновлення списку пакетів | обновляем cписок пакетов
apt update

# install packages | встановлення пакетів | установка пакетов
apt install nodejs npm screen python3 make vim nano \
    mc git wget curl btop htop gcc g++ clang \
    openssh-server net-tools neofetch -y

# install golang | встановлення golang | установка golang
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz 
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz 
export PATH=$PATH:/usr/local/go/bin
rm -rf ./go1.23.4.linux-amd64.tar.gz
go version