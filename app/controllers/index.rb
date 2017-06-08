get '/' do

  #redirect '/login' unless session[:user_id]
  erb :index
end
