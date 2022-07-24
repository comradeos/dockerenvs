from flask import Flask, __version__
import os

app = Flask(__name__)


@app.route('/')
def index():
    workdir = os.path.dirname(__file__)
    return f'Hello from Docker/Python/Flask <br> Working directory: {workdir}'


print(__version__)
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
