from flask import Flask
from flask import request
import sqlite3,json


app = Flask(__name__)

@app.route("/transactions")
def getTransactions():
    db = sqlite3.connect('db_transaction.sqlite')
    cursor = db.cursor()
    result = cursor.execute("SELECT * from bank_transactions")

    data = result.fetchall()

    data_json = []
    header = [i[0] for i in cursor.description]

    for i in data:
        data_json.append(dict(zip(header, i)))

    db.close()
    return json.dumps(data_json)

@app.route("/hello-json")
def hello_json():
    user_data={"email":"john@email.fr"}
    return json.dumps(user_data)

@app.route("/simple-post", methods=['POST'])
def simple_post():
    print(type(request.form))
    print(request.json)
    print(request.form)

    return "Bien recu"

if __name__=="__main__":
    app.run("0.0.0.0", debug=True)