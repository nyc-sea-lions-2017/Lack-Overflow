get '/' do

  #redirect '/login' unless session[:user_id]
  @question = Question.all
  erb :index
end
