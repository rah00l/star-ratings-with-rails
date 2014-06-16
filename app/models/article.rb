class Article < ActiveRecord::Base
  attr_accessible :content, :name  
  has_many :comments, as: :commentable
  has_many :ratings

  belongs_to :user

  # This block belongs to sunshot serach engine where indexing got applied.
  searchable do
    text :name, :content
  end
  
  def average_rating
    ratings.size.zero? ? 0 : ratings.sum(:score) / ratings.size
  end

end
