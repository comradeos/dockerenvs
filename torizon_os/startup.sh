#!/bin/bash
# Установка переменных окружения для VNC сервера
export DISPLAY=:1
export VNC_SERVER_PASSWORD=your_password_here
# Установка пароля VNC
echo $VNC_SERVER_PASSWORD | x11vnc -storepasswd /etc/x11vnc.pass
# Запуск X11 сервера
Xvfb :1 -screen 0 1024x768x16 &
# Ожидание запуска X11
sleep 5
# Запуск XFCE
startxfce4 &
# Запуск VNC сервера
x11vnc -display :1 -usepw -forever &
# Блокировка, чтобы контейнер не завершился
wait