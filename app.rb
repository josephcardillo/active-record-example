require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:ar.sqlite3"

get '/' do
  @users = User.all
  User.create(fname: "John", lname: "Smith", email: "jsmith@email.com", age: 66)
  erb :home
end

get '/user' do
  @user = User.last
  erb :user
end
