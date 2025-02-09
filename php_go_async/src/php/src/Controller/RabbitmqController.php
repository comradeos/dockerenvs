<?php

namespace App\Controller;

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

final class RabbitmqController extends AbstractController
{
    #[Route('/rabbitmq', name: 'app_rabbitmq')]
    public function index(): Response
    {
        $msgText = $_GET['message'] ?? 'no message provided';

        $connection = new AMQPStreamConnection('rabbitmq', 5672, 'user', 'password');

        $channel = $connection->channel();

        $queueName = 'my_queue';

        $channel->queue_declare($queueName, false, false, false, false); // имя очереди, пассивная, долговечная, автоудаление, аргументы

        $message = new AMQPMessage($msgText);

        $channel->basic_publish($message, '', $queueName); 

        $channel->close();

        $connection->close();

        return $this->json([
            'message' => 'Message sent: ' . $msgText,
        ]);
    }
}
