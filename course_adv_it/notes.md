Docker Engine - программа Docker  
Docker Container - мини виртуальная машина  
Docker Image - Образ контейнера  
Dockerfile - Описание образа  

Установка Docker на ubuntu:  
```
sudo apt update
sudo apt install apt-transport-https
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker $USER
>>>logout/login<<<
```

docker run hello-world  

