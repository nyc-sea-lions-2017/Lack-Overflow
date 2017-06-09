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


<<<<<<< HEAD
#get question by id
get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = Comment.find_by(commentable_id: params[:id], commentable_type: "Answer")
  @answers = Answer.find_by(question_id: params[:id])
=======
#get question by question_id
get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
>>>>>>> 1e2ea6194c6ec47f36d39c2602196924b2b1a4ea
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

delete '/questions/:question_id' do
  question = Question.find(params[:question_id])
  question.destroy
  redirect '/'

end
