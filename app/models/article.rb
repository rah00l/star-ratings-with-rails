class Article < ActiveRecord::Base
  attr_accessible :content, :name  
  has_many :comments, as: :commentable
  has_many :ratings

  belongs_to :user

  # This block belongs to sunshot serach engine where indexing got applied.
  searchable do
    text :name#, :content
    text :content, :created_month
    string :created_month
  end

  def created_month
    created_at.strftime("%B %Y")
  end
  
  def average_rating
    ratings.size.zero? ? 0 : ratings.sum(:score) / ratings.size
  end

  def timestamp
    created_at.strftime('%d %B %Y %H:%M:%S')
  end

end
