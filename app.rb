require('sinatra')
require('sinatra/reloader')
require('./lib/customer')
require('./lib/stylist')
require('pg')
require('pry')

DB = PG::Connection.open(:dbname => 'salon')

#### salon_home.erb

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

post '/delete_stylist' do
  stylist_id = params.fetch('stylist_id')
  stylist = Stylist.find_stylist_by_id(stylist_id)
  stylist.delete
  redirect '/'
end

#### stylist.erb

get '/stylists/:id' do
  id = params.fetch("id")
  @stylist = Stylist.find_stylist_by_id(id)
  @associated_customers = Customer.get_customers_for_stylist_id(id)
  erb(:stylist)
end

post '/add_customer' do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id')
  customer = Customer.new({:name => name, :stylist_id => stylist_id,  :id => nil})
  customer.save
  redirect "/stylists/#{stylist_id}"
end


post '/delete_customer' do
  customer = Customer.find_customer_by_id(params.fetch("customer_id").to_i)
  customer.delete
  stylist_id = params.fetch("stylist_id")
  redirect "/stylists/#{stylist_id}"
end
