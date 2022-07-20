import sqlite3,

def insert_dict_transaction_in_db(cursor,dict_transaction):

    id=dict_transaction['id']
    sender=dict_transaction['sender']
    receiver=dict_transaction['receiver']
    amount=dict_transaction['amount']

    sql_insert="INSERT INTO bank_transactions(d,sender,receiver,amount) VALUES (:id,:sender,:receiver,:amount)"
    values={ "id":id,"sender":sender,"receiver":receiver,"amount":amount}

    # appel fonction execute cursor
    cursor.execute(sql_insert,values)
    # cursor.execute(sql_insert)

db = sqlite3.connect('db_transaction.sqlite')
print(type(db))

cursor=db.cursor()
print(type(cursor))

dict_transaction = {"id": 14, "sender": "Leonidas", "receiver": "King", "amount": 9999999}

insert_dict_transaction_in_db(cursor, dict_transaction)

db.commit()

result=cursor.execute("SELECT * from bank_transactions")

lecture = result.fetchall()
print(lecture)

db.close()

# coder une fonction insert_dict_transaction_in_db(cursor, dict_transaction).
# qui prend en entrée un dictionnaire et va insérer son contenu dans la table "transaction"
#Le dictionnaire aura les clés # id # receiver # sender # amount

#db = sqlite3.connect('Freebasededonnée.db')             ##permet de créer un table de donnnée
#cur_connect.execute("CREATE TABLE IF NOT EXISTS Products id PRIMARY KEY,\
#                   (ProductType TEXT,Price FLOAT)")

## EXERCICE 5