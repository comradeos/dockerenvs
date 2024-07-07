FROM debian:latest

# Обновление системы и установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    dbus-x11 \
    xterm \
    wget

# Установка noVNC для веб-доступа к VNC серверу
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz \
    && tar -xvf v1.2.0.tar.gz \
    && mv noVNC-1.2.0 /opt/noVNC \
    && ln -s /opt/noVNC/utils/novnc_proxy /usr/local/bin/

# Копирование скриптов для запуска VNC и noVNC серверов
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Открытие портов для VNC и noVNC
EXPOSE 5900 6080

# Запуск XFCE и VNC сервера
CMD ["/startup.sh"]
