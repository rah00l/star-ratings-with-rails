class Article < ActiveRecord::Base
  attr_accessible :content, :name  
  has_many :comments, as: :commentable
  has_many :ratings

  belongs_to :user
  
  def average_rating
    ratings.size.zero? ? 0 : ratings.sum(:score) / ratings.size
  end

end
