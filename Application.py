from flask import Flask, request
import json, sqlite3
import pymysql

app = Flask(__name__)

## permet de definir quelle type de requete est accepté et pour quoi faire
@app.route("/")
def hello_world():
    result = "<h1>Hi buddy!c'est la racine</h1>"
    return (result)


## Definit le type de GET recu en JSON
@app.route("/hello-json")
def hello_json():
    Data_User = {
        0: {
            "prénom": "Paul",
            "profession": "ingénieur",
            "ville": "Paris",
            "@mail": "paul@ajc.com"},
        1: {
            "prénom": "Julie",
            "profession": " Architecte",
            " ville": "Marseille",
            "@mail": "julie@ajc.com"},
        2: {
            "prénom": "Pierre",
            "profession": "Plombier",
            "ville": "Nantes",
            "@mail": "pierre@ajc.com"},
    }
    Data_User_JSON = json.dumps(Data_User)          ##permet de convertir le dictionnaire TEXT vers JSON
    return (Data_User_JSON)


@app.route("/simple-post", methods=["POST"])
def simple_post():
    print(type(request.form))
    # print(request.json)
    print(request.form)

    return "roger that !"


@app.route("/transaction")
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


@app.route("/mysql")
def getmysql():
    db = pymysql.connect(host='pdwdatabase-1.c03cdsvwieoz.ap-northeast-3.rds.amazonaws.com',
                         user='Pierre_admin',
                         password='squad2022',
                         # database='db',
                         charset='utf8mb4',
                         cursorclass=pymysql.cursors.DictCursor)
    cursor = db.cursor()
    result = cursor.execute("SHOW DATABASES")

    data = cursor.fetchall()

    data_json = []
    header = [i[0] for i in cursor.description]

    for i in data:
        data_json.append(dict(zip(header, i)))

    db.close()
    return json.dumps(data_json)


## PERMET DE GARDER LE FICHIER EN ACTIVITé
if __name__ == "__main__":
    app.run("0.0.0.0", debug=True)

