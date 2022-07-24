FROM python:3.8.13-slim-bullseye
WORKDIR /application
COPY ./requires.txt /application
RUN pip install --upgrade pip
RUN pip install -r /application/requires.txt
ENTRYPOINT [ "python" ]
CMD ["main.py"]