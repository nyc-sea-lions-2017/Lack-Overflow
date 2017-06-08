def current_user
  @user ||= User.find_by(id: session[:user_id])
end

def logged_in
  !!current_user
end

def redirect_if_no_user
  redirect "/login" unless logged_in
end
