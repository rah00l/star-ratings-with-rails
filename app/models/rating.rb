class Rating < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  attr_accessible :score,:comment_id, :user_id
end
