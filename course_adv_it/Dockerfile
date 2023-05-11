# использовать образ amazonlinux
FROM amazonlinux

# обновить список доступных пакетов для установки 
RUN yum -y update

# установить веб сервер apache
RUN yum -y install httpd

# напечатать строку 'Hello from Docker!' с сохнением в файл /var/www/html/index.html
RUN echo 'Hello from Docker!' > /var/www/html/index.html

# запустить сервис самого веб сервераapache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# открыть 80 порт
EXPOSE 80