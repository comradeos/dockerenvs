FROM debian:latest

# установка пакетов 
# mc - Midnight Commander (файловый менеджер) 
# htop - менеджер процессов
# iftop - менеджер сетевых соединений
# vim - редактор
# wget - загрузчик файлов
# curl - утилита для работы с URL (Client URL)
# git - система контроля версий
# python3 - интерпретатор языка программирования Python
# nginx - веб-сервер
# openjdk-17-jdk - Java Development Kit
# openjdk-17-jre - Java Runtime Environment (JRE
# man-db - система документации Linux
RUN apt update && apt install -y mc htop iftop vim wget curl git python3 nginx openjdk-17-jdk openjdk-17-jre man-db

# установка .NET SDK
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y dotnet-sdk-8.0

# установка Go
RUN curl -O https://dl.google.com/go/go1.17.1.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz \
    && rm go1.17.1.linux-amd64.tar.gz

# установка Jenkins
RUN wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null \ 
    && apt update && apt install -y jenkins

# установка переменные окружения для Go
ENV GOPATH=/root/work
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin


RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]

WORKDIR /app

RUN echo "Hello from Debian!"

