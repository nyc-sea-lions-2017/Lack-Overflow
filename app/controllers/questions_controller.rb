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
  redirect "/questions/#{question.id}"
end


#get question by id
get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = Comment.find_by(commentable_id: params[:id], commentable_type: "Answer")
  @answers = Answer.find_by(question_id: params[:id])
  erb :'/questions/show'
end

#edit specific question
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end



#new edit submission
put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update_attributes(title: params[:question][:title], body: params[:question][:body])
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/vote' do

  question = Question.find(params[:id])
  if session[:user_id]
    vote = Vote.new(votable_id:params[:id], votable_type: "Question", voter_id: current_user.id)
    vote.save
    redirect "/questions/#{question.id}"
  else
    redirect '/'
  end
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy
  redirect '/'

end
