class Attachment < ActiveRecord::Base

  # ############################# Scema Information ##############################################################
  #	Column				Type		Collation				Null		Default
  # 1	id				int(11)								No	None	AUTO_INCREMENT
  # 2	file			varchar(255)	utf8_unicode_ci		Yes	NULL
  # 3	attachable_id	int(11)								Yes	NULL
  # 4	attachable_type	varchar(255)	utf8_unicode_ci		Yes	NULL
  # 5	user_id			int(11)								Yes	NULL
  # 6	created_at		datetime							No	None
  # 7	updated_at		datetime							No	None
  # ############################# Scema Information ##############################################################

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
