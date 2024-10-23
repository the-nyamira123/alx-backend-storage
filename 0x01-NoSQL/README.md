MongoDB NoSQL Project
This repository contains a collection of tasks designed to help you learn how to use MongoDB, a popular NoSQL database application.

Overview
Each task demonstrates key operations in MongoDB, from basic database manipulation to more advanced Python scripts using the pymongo library.

Task List
MongoDB Shell Scripts
List all databases
0-list_databases
Script to list all databases in MongoDB.

Create a database
1-use_or_create_database
Script to create or use the database my_db.

Insert document
2-insert
Script to insert a document in the collection school with the attribute name set to “Holberton school”.

List all documents
3-all
Script to list all documents in the school collection.

Find documents by attribute
4-match
Script to list all documents with name="Holberton school" in the school collection.

Count documents
5-count
Script to display the number of documents in the school collection.

Update documents
6-update
Script to update documents with name="Holberton school" by adding a new attribute address set to "972 Mission street".

Delete documents by attribute
7-delete
Script to delete all documents with name="Holberton school" in the school collection.

Python Scripts (using pymongo)
List all documents in Python
8-all.py
Python function to list all documents in a collection:

python
Copy code
def list_all(mongo_collection):
Insert a document in Python
9-insert_school.py
Python function to insert a new document in a collection using kwargs:

python
Copy code
def insert_school(mongo_collection, **kwargs):
Update school topics
10-update_topics.py
Python function to update the topics of a school document based on the name:

python
Copy code
def update_topics(mongo_collection, name, topics):
Find schools by topic
11-schools_by_topic.py
Python function to return schools having a specific topic:

python
Copy code
def schools_by_topic(mongo_collection, topic):
Log statistics
12-log_stats.py
Python script that provides stats about Nginx logs stored in MongoDB, including:

Total logs.
Count of logs for each HTTP method.
Count of GET requests to /status.
Regex filter
100-find
MongoDB script to list all documents with name starting with "Holberton" in the school collection.

Top students
101-students.py
Python function to return all students sorted by average score:

python
Copy code
def top_students(mongo_collection):
Extended log stats
102-log_stats.py
Extended version of 12-log_stats.py, adding a feature to display the top 10 most frequent IP addresses.
