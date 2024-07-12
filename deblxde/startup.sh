#!/bin/bash
# Настройка переменных окружения для VNC сервера
export DISPLAY=:1
export X11VNC_OPTS="-forever -usepw -create"

# Запуск Xvfb
Xvfb $DISPLAY -screen 0 1024x768x16 &

# Ожидание запуска Xvfb
sleep 5

# Запуск XFCE
startxfce4 &

# Запуск x11vnc
x11vnc $X11VNC_OPTS &

# Блокировка, чтобы контейнер не завершился
wait