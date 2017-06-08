class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :commentable, polymorphic:true
  belongs_to :votable, polymorphic:true
end
