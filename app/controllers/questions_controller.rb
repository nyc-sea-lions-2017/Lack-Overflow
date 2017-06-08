#all questions
get '/questions' do

  redirect '/'
end


#new post form
get '/questions/new' do
  erb :'/questions/new'
end


#new post submission
post '/questions' do
  question = Question.new(title:params[:title], body: params[:body], creator_id: session[:user_id])
  question.save
  redirect "/questions/#{question.id}"
end


#get question by id
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

#edit specific question
get '/questions/:id/edit' do

end

#new edit submission
put '/questions/:id' do

end

#delete specific question

delete '/questions/:id' do

end
