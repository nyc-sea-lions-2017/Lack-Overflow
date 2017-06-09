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
  redirect "/questions/#{question.question_id}"
end


#get question by question_id
get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'/questions/show'
end

#edit specific question
get '/questions/:question_id/edit' do
  @question = Question.find(params[:question_id])
  erb :'/questions/edit'
end



#new edit submission
put '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @question.update_attributes(title: params[:question][:title], body: params[:question][:body])
  redirect "/questions/#{@question.question_id}"
end

#delete specific question

delete '/questions/:question_id' do
  question = Question.find(params[:question_id])
  question.destroy
  redirect '/'

end
