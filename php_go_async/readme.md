для сборки всего дерьма
docker-compose down --remove-orphans
docker-compose up --build

PHP Symphony 
Создание контроллера
php bin/console make:controller TestController

Для отправки в RabbitMQ
установить php-amqplib
composer require php-amqplib/php-amqplib

для отримання на go 
go get github.com/streadway/amqp

http://localhost:9000/send/message?msg=12323
http://localhost:9000/redis?action=set&message=aaaaa