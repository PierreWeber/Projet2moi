import sqlite3

connect = sqlite3.connect('db_transaction.sqlite')  ##Permet la connection a la base de donnée
print(type(connect))

cursor = connect.cursor() ## Permet d'avoir un index sur la base de donnée
print(type(cursor))

cursor.execute("SELECT * FROM bank_transactions")  ## permet d'executer les requete SQL dans la table "bank_transactions"

col = cursor.fetchall()     ## permet de lire les resultats dans la table
print(col)                  ## Affiche la table
print(col[2])               ## Affiche l'element 3 de la table

cursor.close()              ##ferme le curseur seul
connect.close()             ## faut obligatoirement fermer la connection


# Il existe plusieurs manières de se connecter à une base de donnée, mais la plupart sont similaires. Il faut utiliser une librairie qui établit une connexion avec la base. Avec cette connexion il est ensuite possible de faire des requêtes SQL.
# # Dans ce premier exercice on va apprendre à manipuler une base sqlite
# # 1. importer la librairie sqlite3
# # 2. Avec la méthode connect de sqlite3, créer une connexion. La méthode connect attend le nom du fichier contenant la base de donnée.
# # 3. Afficher le type de la variable connect
# # 4. Appeler la méthode cursor de l'objet connexion. Stocker le retour dans la variable cursor.
# # 5. Afficher son type
# # 6. Appeler la méthode close de l'object connexion
# Reprendre la base de donnée
# # 1. Se connecter à cette base avec sqlite3 et créer un objet cursor.
# # 2. Créer une chaîne de caractère qui permet de selectionner toutes les transaction stockées dans la base de données.
# # 3. A l'aide de l'objet cursor executer la requête
# # 4. Avec la méthode fetchall de l'objet cursor récupérer les résultats de la requête et les afficher.
# # 5. Fermer la connexion en appelant la méthode close de l'objet connexion