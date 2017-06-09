get '/questions/:question_id/answers/new' do
  # binding.pry
  @answerer = current_user
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end


#new post submission
post '/questions/:question_id/answers/:answerer_id' do
  # binding.pry
  @question = Question.find(params[:question_id])
  @answerer = params[:aswerer_id]
  answer = @question.answers.new(text: params[:answer][:text], answerer_id: params[:answerer_id])
  answer.save
  erb :'/questions/show'
end


#get answer by id
get '/questions/:question_id/answer/:answer_id' do
  @question = Question.find(params[:question_id])
  @question = @question.answers.find(params[:answer_id])
  erb :'/questions/show'
end

#edit answer question
get '/questions/:question_id/answers/:answer_id/edit' do
  # binding.pry
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  erb :'/answers/edit'
end


#new edit submission
put '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  # binding.pry
  @answer.update_attributes(text: params[:answer][:text])

  erb :"/questions/show"
end

post '/questions/:question_id/answers/:answer_id/vote' do
  if current_user
    answer= Answer.find(params[:answer_id])
    vote = Vote.new(votable_id: params[:answer_id], votable_type: "Answer", voter_id: current_user.id)
    vote.save
    redirect "/questions/#{params[:question_id]}"
  else
    redirect "/login"
  end
end

#delete specific question

delete '/questions/:question_id/answers/:answer_id' do
  # binding.pry
  question = Question.find(params[:question_id])
  answer = question.answers.find(params[:answer_id])
  answer.destroy
  redirect "/questions/#{question.id}"
end
