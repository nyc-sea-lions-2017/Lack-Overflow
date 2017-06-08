class Comment < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
end
