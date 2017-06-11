get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @questions = Question.all
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  user = User.find(params[:id])
  if current_user == @user
    erb :'users/show'
  else
    redirect "/users/#{current_user.id}" if logged_in
    redirect '/'
  end
end
