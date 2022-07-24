FROM python:alpine3.16

WORKDIR /app

COPY requires.txt .

RUN pip install -r requires.txt

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]