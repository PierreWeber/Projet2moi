import sqlite3

connect = sqlite3.connect('db_transaction.sqlite')
cur_connect = connect.cursor()
# cur_connect.execute("INSERT INTO bank_transactions VALUES(10,'Midas','',100000)")
value_sql="INSERT INTO bank_transactions VALUES(12,'Lucas','Midas',100000)"                      # -> comble les colonnes
# value_sql="INSERT INTO bank_transactions(id,sender,receiver,amount) VALUES(9,'Power','Edge',99999)"  #-> va dire que la valeur est nulle " none "
cur_connect.execute ("SELECT * FROM bank_transactions")

connect.commit() ## permet de faire un etat de la base de données apres l'execute

lecture = cur_connect.fetchall()
print(lecture)
connect.close()


##ENONCE
# 1. Se connecter à cette base avec sqlite3 et créer un objet cursor.
# 2. Créer une chaîne de caractère qui permet d'insérer une ligne dans la table transaction. Le valeur pour id sera 10, receiver_name="Midas" et le montant 100000
# 3. A l'aide de l'objet cursor executer la requête  et stocker le résultat dans la variable result.
# Pour une requête d'insertion il faut appeler la méthode commit après avoir faire le execute.
# 4. Fermer la connexion en appelant la méthode close de l'objet connexion
# 5. Faire un select pour vérifier que la données est bien ajoutée