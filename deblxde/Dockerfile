# Используйте официальный образ Debian
FROM debian:latest

# Установите необходимые пакеты
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    x11vnc \
    xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Настройте VNC
RUN mkdir ~/.vnc
# Замените 'your_password' на ваш пароль
RUN x11vnc -storepasswd your_password ~/.vnc/passwd

# Добавьте скрипт для запуска сессии XFCE и VNC сервера
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Откройте порт VNC сервера
EXPOSE 5900

# Запустите скрипт при старте контейнера
CMD ["/startup.sh"]