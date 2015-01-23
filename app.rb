require('sinatra')
require('sinatra/reloader')
require('customer')
require('stylist')
require('pg')
require('pry')

get '/' do
  @all_stylists = Stylist.all()
  erb(:salon_home)
end
