from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.vfwnlxs.mongodb.net/?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech
 
students = db.students

student_list = students.find({})

print("\n students documents from find() query")

for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

John = students.find_one({"student_id": "1007"})

print("\n students documents from find_one() query")

print("  Student ID: " + John["student_id"] + "\n  First Name: " + John["first_name"] + "\n  Last Name: " + John["last_name"] + "\n")

input("\n End of program, press any key to continue...")
