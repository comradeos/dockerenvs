from flask_sqlalchemy import SQLAlchemy
from flask import Flask
import random
import os
import cryptography


app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(12).hex()
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@db/my_db'


db = SQLAlchemy(app)


class DataTest(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    value = db.Column(db.String(200))

    def __repr__(self):
        return f'my_table: {self.id}, {self.value}'


@app.route('/')
def index():
    return f'application: index page'


@app.route('/add')
def add():
    random_value = random.randint(10000, 99999)
    try:
        new = DataTest(id=None, value=random_value)
        db.session.add(new)
        db.session.commit()
        return f'application data: value {random_value} added to database'
    except:
        return f'application data: something went wrong'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='5000')
