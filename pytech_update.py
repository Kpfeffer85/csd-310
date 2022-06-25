import certifi 
from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.urpvr.mongodb.net/pytech"
ca= certifi.where()

client = MongoClient(url, tlsCAFile = ca)
db = client.pytech
students = db.students
student_list = students.find({})

print("\n --DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

for doc in student_list:
    print (" Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Philips"}})

fred = students.find_one({"student_id": "1007"})
print("\n --DISPLAYING STUDENT DOCUMENT 1007 --")

print(" Student ID: " + fred["student_id"] + "\n First Name: " + fred["first_name"] + "\n Last Name: " + fred["last_name"] + "\n")

input("\n\n End of program, press any key to continue...")