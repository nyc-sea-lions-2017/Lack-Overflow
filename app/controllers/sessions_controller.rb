get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect Email or Password"]
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  session.clear()
  redirect '/'
end