require('sinatra')
require('sinatra/reloader')
require('./lib/customer')
require('./lib/stylist')
require('pg')
require('pry')

configure :development do
set :bind, '0.0.0.0'
set :port, 3000
end

DB = PG::Connection.open(:dbname => 'salon')


get '/' do
  @all_stylists = Stylist.all()
  erb(:salon_home)
end

post '/add_stylist' do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  redirect'/'
end

post '/add_customer' do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id')
  customer = Customer.new({:name => name, :stylist_id => stylist_id,  :id => nil})
  redirect "/stylists/#{stylist_id}"
end

get '/stylists/:id' do
  id = params.fetch("id")
  binding.pry
  @stylist = Stylist.find_stylist_by_id(id)
  @associated_customers = Customer.get_customers_for_stylist_id(id)
  erb(:stylist)
end