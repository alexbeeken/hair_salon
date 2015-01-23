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