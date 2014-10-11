class Article < ActiveRecord::Base
  attr_accessible :content, :name , :published_at, :created_at, :tag_list
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :ratings

  belongs_to :user
  # after_create only calls once at the time of record creation \ but after_save will call every time of record updation also
  after_create :set_published_at

  default_scope order: 'published_at DESC'

  acts_as_taggable

  # Validation 
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  # This block belongs to sunshot serach engine where indexing got applied.
  searchable  do
    text :name#, :content
    text :content, :published_month
    text :comments do
      comments.map { |comment| comment.content }
    end
    time :published_at
    string :published_month

  end

  def published_month
    published_at.strftime("%B %Y") unless published_at.blank?
  end
  
  def average_rating
    ratings.size.zero? ? 0 : ratings.sum(:score) / ratings.size
  end

  def timestamp
    published_at.strftime('%d %B %Y %H:%M:%S') unless published_at.blank?
  end

private

  def set_published_at
    value = (self.created_at + 1.day) unless self.created_at.nil?
    self.update_attributes(:published_at => value)
  end  

  

end
