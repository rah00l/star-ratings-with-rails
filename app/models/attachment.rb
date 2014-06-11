class Attachment < ActiveRecord::Base
  attr_accessible :file, :attachable_type, :attachable_id, :user_id

  mount_uploader :file, FileUploader
  belongs_to :attachable, :polymorphic => true

end
