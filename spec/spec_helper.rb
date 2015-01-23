require('rspec')
require('pg')
require('pry')

DB = PG::Connection.open(:dbname => 'test_salon')

RSpec.configure do |config|
config.after(:each) do
DB.exec("DELETE FROM stylists;")
  DB.exec("DELETE FROM customers;")
end
end