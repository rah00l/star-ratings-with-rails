class Photo < ActiveRecord::Base
  attr_accessible :filename, :name, :attachments_attributes

  has_many :comments, as: :commentable

  has_many :attachments, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments

   belongs_to :user
end
