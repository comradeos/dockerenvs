<?php

namespace App\Controller;

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

final class SendMessageController extends AbstractController
{
    #[Route('/send/message', name: 'app_send_message')]
    public function index(): Response
    {
        // Получаем параметр msg из запроса
        $msgText = $_GET['msg'] ?? 'no msg provided';

        // Подключение к RabbitMQ.
        // Если вы используете docker-compose, то имя хоста для RabbitMQ – это имя сервиса (в вашем случае "rabbitmq")
        $connection = new AMQPStreamConnection('rabbitmq', 5672, 'user', 'password');
        $channel = $connection->channel();

        // Объявляем очередь, если она еще не существует.
        $queueName = 'my_queue';
        $channel->queue_declare($queueName, false, false, false, false); // имя очереди, пассивная, долговечная, автоудаление, аргументы

        // Создаем сообщение
        $message = new AMQPMessage($msgText);

        // Отправляем сообщение в указанную очередь
        $channel->basic_publish($message, '', $queueName); // сообщение, обменник, ключ маршрутизации

        // Закрываем канал и соединение
        $channel->close();
        $connection->close();

        // Возвращаем ответ клиенту
        return $this->json([
            'message' => 'Сообщение отправлено: ' . $msgText,
        ]);
    }
}
