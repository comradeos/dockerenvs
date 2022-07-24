<!-- создать виртуальное окружение Windows -->
python -m venv venv
<!-- активировать виртуальное окружение -->
.\venv\Scripts\activate
<!-- деактивировать виртуальное окружение -->
deactivate

<!-- создать виртуальное окружение Linux -->
python3 -m venv venv
<!-- активировать виртуальное окружение -->
source venv/bin/activate
<!-- деактивировать виртуальное окружение -->
deactivate

<!-- создать новый проект django с именем my_project-->
django-admin startproject my_project

<!-- запустить проект -->
python .\my_project\manage.py runserver
<!-- адрес проекта http://127.0.0.1:8000/ -->

<!-- для Dockerfile использовать следующее -->
FROM python:alpine3.16
ENV PYTHONUNBUFFERED=1
WORKDIR /my_project
COPY required.txt .
RUN pip install --upgrade pip
RUN pip install -r required.txt
ENTRYPOINT [ "python" ]
CMD [ "manage.py", "runserver", "0.0.0.0:8000"]