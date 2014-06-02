class Comment < ActiveRecord::Base
  attr_accessible :content
  has_many :ratings
  belongs_to :commentable, polymorphic: true


 def average_rating
    ratings.size.zero? ? 0 : ratings.sum(:score) / ratings.size
 end	

end
