## Hair Salon Customer Lists

This is a simple website to keep track of which clients your workers regularly service.

## Installation

1. Navigate to a local directory of your choice and clone the project with 'git clone http://github.com/alexbeeken/hair_salon.git' (or if you have forked the project, this URL will be the url of your fork). Install bundler if you haven't already 'gem install bundler' and run 'bundle' inside the project directory.

2. Before you can run Sinatra and see it working, you will need to create a database and two tables and host them with Postgresql on your local machine. (Postgresql installation instructions here: https://wiki.postgresql.org/wiki/Detailed_installation_guides). Start postgresql with 'postgres' and then in another terminal window run 'psql'.

3. You'll need to run the following commands inside of psql.

CREATE DATABASE salon;

CREATE TABLE stylists (id SERIAL PRIMARY KEY, name VARCHAR);

CREATE TABLE customers (id SERIAL PRIMARY KEY, name VARCHAR, styist_id INT);

(If you'd like to use a different database you'll have to change the database specified in line 8 of app.rb.)

## Tests

If you'd like to run the tests, you'll need to create a test database. If you have already created the database you can make it with the following command inside of psql(see installation above):

CREATE DATABASE test_salon WITH TEMPLATE salon;

If you haven't created the salon database yet you can just run these commands:

CREATE DATABASE test_salon;

CREATE TABLE stylists (id SERIAL PRIMARY KEY, name VARCHAR);

CREATE TABLE customers (id SERIAL PRIMARY KEY, name VARCHAR, styist_id INT);

## Contributing

Fork the project and then replace the url in Installation instructions with that of your own copy.

If you are confused don't hesitate to email me at aeb242@gmail.com.

## License

MIT
