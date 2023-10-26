from flask import Flask
import mysql.connector
  

app = Flask(__name__)

@app.route("/")
def hello():

    host = "localhost" ; port = 3307  # local 
    host = "mysql" ; port = 3306  # docker

    db = mysql.connector.connect(
        host = host,
        port = port,
        user = "root",
        passwd = "root",
        database = "my_db"
    )

    cursor = db.cursor()
    query = "SELECT * FROM users"
    cursor.execute(query)
    result = cursor.fetchall()

    db.close()

    return f"Привіт з контейнеризованої апплікухи! {result[0][1]}"


if __name__ == '__main__':
    app.run()