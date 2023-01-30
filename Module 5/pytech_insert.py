from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.vfwnlxs.mongodb.net/?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech

John = {
    "student_id": "1007",
    "first_name": "John",
    "last_name": "Deemer",
}

Miranda = {
    "student_id": "1008",
    "first_name": "Miranda",
    "last_name": "Tylers",
}

Myles = {
    "student_id": "1009",
    "first_name": "Myles",
    "last_name": "Adams",
}

students = db.students

John_student_id = students.insert_one(John).inserted_id
Miranda_student_id = students.insert_one(Miranda).inserted_id
Myles_student_id = students.insert_one(Myles).inserted_id

print("\n  -- INSERT STATEMENTS --")
print("  Inserted student record John Deemer into the students collection with document_id " + str(John_student_id))
print("  Inserted student record Miranda Tylers into the students collection with document_id " + str(Miranda_student_id))
print("  Inserted student record Myles Adams into the students collection with document_id " + str(Myles_student_id))

input("\n\n  End of program, press any key to exit... ")
