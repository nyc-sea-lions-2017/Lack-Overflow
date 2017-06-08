class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :votes, as: :votable
  has_many :answers
  has_many :answerers, through: :answers
  has_many :comments, as: :commentable
end
