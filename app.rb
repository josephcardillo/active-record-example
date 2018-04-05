require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'sinatra/flash'
enable :sessions

set :database, "sqlite3:ar.sqlite3"

def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
end


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
  # should be called user instead of post
  User.create(params[:post])
  redirect '/users'
end

post '/sign-in' do
  @user = User.where(fname: params[:fname]).first
  if @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You've been signed in successfully."
    redirect '/'
  else
    flash[:notice] = "There was a problem signing you in."
    redirect '/sign-in-failed'
  end
end

get '/sign-in-failed' do
  erb :sign_in_failed
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
