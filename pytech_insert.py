from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.urpvr.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
students = db.students

mark = {
    "first_name" : "Mark",
    "last_name" : "Smith",
    "student_id": "1007"
}

johnny = {
    "first_name" : "Johnny",
    "last_name" : "Jones",
    "student_id": "1008"
}

misty = {
    "first_name" : "Misty",
    "last_name" : "Marks",
    "student_id": "1009"
}

student1 = students.insert_one(mark).inserted_id
student2 = students.insert_one(johnny).inserted_id
student3 = students.insert_one(misty).inserted_id

print("--INSERT STATEMENTS--")
print("Inserted student record " + mark["first_name"] + " " + mark["last_name"] + " into the students collection with document_id " + str(student1))
print("Inserted student record " + johnny["first_name"] + " " + johnny["last_name"] + " into the students collection with document_id " + str(student1))
print("Inserted student record " + misty["first_name"] + " " + misty["last_name"] + " into the students collection with document_id " + str(student1))