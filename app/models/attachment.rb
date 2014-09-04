class Attachment < ActiveRecord::Base
  attr_accessible :file, :attachable_type, :attachable_id, :user_id

  mount_uploader :file, FileUploader
  belongs_to :attachable, :polymorphic => true

  cattr_accessor :current_user

  after_create :set_user_id

  private

  def set_user_id
  	self.update_attributes(:user_id => current_user.id) unless current_user.nil?
  end
  
end
