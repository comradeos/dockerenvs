package main

import (
	"fmt"
	"log"
    "net/http"
	"github.com/streadway/amqp"
)

// failOnError обрабатывает ошибки
func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}

// consumeMessages подключается к RabbitMQ и слушает очередь
func consumeMessages() {
	// Подключаемся к RabbitMQ. Важно: здесь используется имя хоста "rabbitmq",
	// которое должно совпадать с именем сервиса в docker-compose.
	conn, err := amqp.Dial("amqp://user:password@rabbitmq:5672/")
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()

	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	// Объявляем очередь (если она не создана, то она будет создана)
	q, err := ch.QueueDeclare(
		"my_queue", // имя очереди
		false,      // durable
		false,      // delete when unused
		false,      // exclusive
		false,      // no-wait
		nil,        // arguments
	)
	failOnError(err, "Failed to declare a queue")

	// Регистрируем потребителя
	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		true,   // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	failOnError(err, "Failed to register a consumer")

    // Метод подписывает на очередь, возвращая канал (channel) Go‑языка, по которому будут поступать сообщения.
    
    // Аргументы метода Consume:
    
    // q.Name:
    // Имя очереди, с которой подписываемся (в данном случае "my_queue").
    // "" (consumer):
    // Идентификатор потребителя. Пустая строка означает, что сервер назначит автоматическое имя.
    // true (autoAck):
    // Включает автоматическое подтверждение получения сообщения. Это значит, что как только сообщение доставлено, оно помечается как обработанное, и сервер удаляет его из очереди.
    // false (exclusive):
    // Позволяет использовать очередь нескольким потребителям одновременно.
    // false (noLocal):
    // Обычно не используется в RabbitMQ (значение оставляется по умолчанию).
    // false (noWait):
    // Если false, метод ожидает подтверждения регистрации потребителя от сервера.
    // nil (args):
    // Дополнительные аргументы для настройки потребителя (не используются в данном примере).





	// Обрабатываем полученные сообщения в горутине
	go func() {
		for d := range msgs {
			fmt.Printf("A message has been received: %s\n", d.Body)
			// Здесь можно добавить логику обработки полученного сообщения
		}
	}()

	fmt.Println(" [*] Waiting for messages. To exit press CTRL+C")
	// Блокируем выполнение, чтобы горутина не завершилась.
	forever := make(chan bool)
	<-forever
}

func main() {
	// Запускаем потребителя сообщений в отдельной горутине
	go consumeMessages()

	// Если требуется, можно оставить HTTP-сервер для других задач
	// Например, согласно вашему примеру:
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, world!")
	})

	fmt.Println("Server running on http://localhost:8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("HTTP server error: %s", err)
	}
}
