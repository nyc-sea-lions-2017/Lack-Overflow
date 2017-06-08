10.times do |user|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Ancient.titan)
end

user = User.all
user.each do |user|
  Question.create(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, creator_id: user.id)
end

questions = Question.all
users = User.all
users.each do |user|
  questions.each do |question|
    Answer.create(text: Faker::Hacker.say_something_smart, answerer_id: user.id, question_id: question.id )
  end
end


10.times do |comment|
  Comment.create(text: Faker::ChuckNorris.fact, commenter_id: rand(1..10), commentable_id: rand(1..10) , commentable_type: ['Answer','Comment'].sample )
end

10.times do |vote|
  Vote.create(voter_id: rand(1..10), votable_id: rand(1..10), votable_type: ['Answer', 'Comment'].sample)
end
