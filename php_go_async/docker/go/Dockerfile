FROM golang:1.23

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код
COPY ./src/go/ /app

# Сборка приложения для Linux amd64
RUN go build -o app

# Указываем порт
EXPOSE 8080

# Запуск скомпилированного приложения
# CMD ["./app"]
# CMD ["cat", "/etc/os-release"]
