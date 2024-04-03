from sqlalchemy import create_engine, MetaData
import mysql.connector
from core import Core
import os
import re

# Créer le moteur SQLAlchemy
dbconfig = Core.config.database
engine = create_engine(f"mysql+mysqlconnector://{dbconfig.login.user}:{dbconfig.login.password}@{dbconfig.host}:{dbconfig.port}/{dbconfig.name}")

print("[*] Suppression de la base de données...", end="\r")
# Créer un objet MetaData
metadata = MetaData()
# Lier le moteur à la métadonnée
metadata.reflect(bind=engine)
# Supprimer toutes les tables de la base de données
metadata.drop_all(engine)
print("[+] Base de données supprimée avec succès")

print("[*] Initialisation de la base de données...", end="\r")

script_sql = []

for filename in sorted(os.listdir("./sql")):
    if re.search(r"V[0-9]{0,}__.*\.sql", filename):
        script_sql.append(open("./sql/" + filename, encoding="utf8").read())

connector = mysql.connector.connect(host=dbconfig.host,
                                    user=dbconfig.login.user,
                                    password=dbconfig.login.password,
                                    database=dbconfig.name)

cursor = connector.cursor()
cursor.execute("\n\n\n".join(script_sql))

cursor.close()
connector.close()

print("[+] Initialisation terminé", end=" "*20)
