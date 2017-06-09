#all questions
get '/questions' do
  @question = Question.all
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
post '/questions/:question_id/vote' do
  question = Question.find(params[:id])
  if session[:user_id]
    vote = Vote.new(votable_id:question.id, votable_type: "Question", voter_id: current_user.id)
    vote.save
  else
    redirect '/'
  end
end

delete '/questions/:question_id' do
  question = Question.find(params[:question_id])
  question.destroy
  redirect '/'

end
