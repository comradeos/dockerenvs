<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

use Redis;

final class RedisController extends AbstractController
{
    #[Route('/redis', name: 'app_redis')]
    public function index(): JsonResponse
    {
        $action = $_GET['action'] ?? 'no action provided';
        $message = $_GET['message'] ?? 'no message provided';

        // url example: /redis?action=set&message=hi

        $redis = new Redis();
        $redis->connect('redis', 6379); // имя хоста определено в docker-compose.yml в секции services (в данном случае - redis)

        if ($action == 'set') {
            $redis->set("test_key", $message);

            return $this->json([
                'message' => "set message: $message"
            ]);
        } 
        
        if ($action === 'get') {
            $message = $redis->get("test_key");
            
            return $this->json([
                'message' => "get message: $message"
            ]);
        }

        return $this->json([
            'message' => "action must be set or get"
        ]);
    }
}
