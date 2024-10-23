Redis Basics
This project contains tasks for learning to use the Redis NoSQL data storage application through Python3.

Tasks To Complete
 0. Writing strings to Redis<br/>exercise.py contains a Python script that meets the following requirements:

Create a Cache class. In the __init__ method, store an instance of the Redis client as a private variable named _redis (using redis.Redis()) and flush the instance using flushdb.
Create a store method that takes a data argument and returns a string. The method should generate a random key (e.g. using uuid), store the input data in Redis using the random key, and return the key.
Type-annotate store correctly. Remember that data can be a str, bytes, int, or float.
 1. Reading from Redis and recovering original type<br/>exercise.py contains a Python script with the following updates to the previous task:

Redis only allows storing strings, bytes, and numbers (and lists thereof). Any stored data is returned as a byte string. For example, if you store "a" as a UTF-8 string, it will be returned as b"a" when retrieved from the server.
Implement a get method that takes a key string argument and an optional Callable argument named fn. This callable will convert the data back to its original format.
Ensure the get method conserves the original Redis.get behavior if the key does not exist.
Implement two additional methods: get_str and get_int, which will automatically parameterize Cache.get with the correct conversion function.
The following code should not raise an exception:
python
Copy code
cache = Cache()

TEST_CASES = {
    b"foo": None,
    123: int,
    "bar": lambda d: d.decode("utf-8")
}

for value, fn in TEST_CASES.items():
    key = cache.store(value)
    assert cache.get(key, fn=fn) == value
 2. Incrementing values<br/>exercise.py contains a Python script with the following updates to the previous task:

Familiarize yourself with the INCR command and its Python equivalent.
Define a count_calls decorator that takes a single method Callable argument and returns a Callable.
Use the qualified name of method (using __qualname__) as a key to track the number of times the method is called.
Create and return a function that increments the count for that key every time the method is called and returns the original method's value.
Decorate Cache.store with count_calls.
 3. Storing lists<br/>exercise.py contains a Python script with the following updates to the previous task:

Familiarize yourself with the Redis commands RPUSH, LPUSH, LRANGE, etc.
Define a call_history decorator that stores the history of inputs and outputs for a particular function.
Each time the decorated function is called, append its input arguments to one list in Redis and store its output in another list.
In call_history, use the decorated function’s qualified name and append ":inputs" and ":outputs" to create input and output list keys, respectively.
Use rpush to append input arguments (convert them to strings with str(args)) and store the output in the "...:outputs" list.
Decorate Cache.store with call_history.
 4. Retrieving lists<br/>exercise.py contains a Python script with the following updates to the previous task:

Implement a replay function to display the history of calls to a particular function.
The output should look like this:
py
Copy code
>>> cache = Cache()
>>> cache.store("foo")
>>> cache.store("bar")
>>> cache.store(42)
>>> replay(cache.store)
Cache.store was called 3 times:
Cache.store(*('foo',)) -> 13bf32a9-a249-4664-95fc-b1062db2038f
Cache.store(*('bar',)) -> dcddd00c-4219-4dd7-8877-66afbe8e7df8
Cache.store(*(42,)) -> 5e752f2b-ecd8-4925-a3ce-e2efdee08d20
 5. Implementing an expiring web cache and tracker<br/>web.py contains a Python script that meets the following requirements:

Implement a get_page function (prototype: def get_page(url: str) -> str:) that uses the requests module to fetch the HTML content of a URL and returns it.
Track how many times a particular URL is accessed by incrementing a Redis key ("count:{url}"), and cache the result with an expiration time of 10 seconds.
Tip: Use http://slowwly.robertomurray.co.uk to simulate a slow response and test your caching.
Bonus: Implement this use case with decorators.

