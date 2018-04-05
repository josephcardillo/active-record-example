require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:ar.sqlite3"

get '/' do
  @users = User.all
  erb :home
end

get '/users' do
  @users = User.all
  erb :users
end

get '/user/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :user
end

post '/users/new' do
  puts "*********************"
  puts params.inspect
  puts "*********************"
end

# params {
#   "post" => {
#     "title"=>"Hello World", "text"=>"Lorem ipsum
# dolor sit amet lalal"
#   }
# }
#
# @post = Post.new(params)
#
# @post = Post.new(params[:post])
# @post = Post.new(title: params[:title], text: params[:text])
