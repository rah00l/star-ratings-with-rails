class Music < ActiveRecord::Base
  attr_accessible :description, :featured, :summary, :title, :user_id, :attachments_attributes

  has_many :attachments, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments

  validates :title, presence: true, uniqueness: true
  
end
