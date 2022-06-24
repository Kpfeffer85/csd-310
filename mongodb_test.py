import certifi 
from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.urpvr.mongodb.net/pytech"
ca= certifi.where()

client = MongoClient(url, tlsCAFile = ca)
db = client.pytech
print('\n -- Pytech Collection List --')
print(db.list_collection_names())


input("\n\n  End of program, press any key to exit... ")





