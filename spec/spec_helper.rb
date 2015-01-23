require('rspec')
require('pg')
require('pry')

DB = PG::Connection.open(:dbname => 'test_salon')

RSpec.configure do |config|
config.after(:each) do
DB.exec("DELETE FROM test_stylist;")
  DB.exec("DELETE FROM test_clients;")
end
end