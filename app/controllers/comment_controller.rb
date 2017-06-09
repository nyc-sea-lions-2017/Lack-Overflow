get 'questions/:question_id/comments/new' do
  erb :comment
end

post 'questions/:question_id/comments' do
  @comment = Comment.create(text: params[:text], commenter_id: session[:id], commentable_id: params[:question_id], commentable_type: "question")
  erb :'/questions/<%= params[:question_id] %>'
end

get 'answers/:answer_id/comments/new' do
  erb :comment
end

post 'answers/:answer_id/comments' do
  @comment = Comment.create(text: params[:text], commenter_id: session[:id], commentable_id: params[:answer_id], commentable_type: "answer")
  erb :'/answers/<%= params[:answer_id] %>'
end

post '/comments/:id/vote' do
  if current_user

    comment = Comment.find(params[:id])
    vote = Vote.new(voter_id: current_user.id, votable_id: comment.id, votable_type:'Comment')
    vote.save
    redirect "/questions/#{comment.answer.question.id}"
    end
  end
