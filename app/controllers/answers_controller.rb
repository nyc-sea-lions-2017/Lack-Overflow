get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end


#new post submission
post '/questions/:question_id/answers' do
  # binding.pry
  @question = Question.find(params[:question_id])
  answer = @question.answers.new(text: params[:answer][:text])
  answer.save
  redirect "/questions/#{@question.id}"
end


#get question by id
get '/questions/:question_id/answer/:answer_id' do
  @question = Question.find(params[:question_id])
  @question = @question.answers.find(params[:answer_id])
  erb :'/questions/show'
end

#edit specific question
get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  erb :'/answers/edit'
end


#new edit submission
put '/questions/:question_id/answers/:answer_id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  binding.pry
  @answer.update_attributes(text: params[:answer][:text])

  erb :"/questions/show"
end

#delete specific question

delete '/questions/:question_id/answers/:answer_id' do
  # binding.pry
  question = Question.find(params[:question_id])
  answer = question.answers.find(params[:answer_id])
  answer.destroy
  redirect '/'
end