class Music < ActiveRecord::Base

# ############################# Scema Information ##############################################################
 #	Column			Type		Collation				Null		Default
 # 1	id			int(11)								No			AUTO_INCREMENT
 # 2	title		varchar(255) utf8_unicode_ci		Yes			NULL
 # 3	description	text		utf8_unicode_ci			Yes			NULL
 # 4	featured	tinyint(1)							Yes			NULL
 # 5	summary		text	utf8_unicode_ci				Yes			NULL
 # 6	user_id		int(11)								Yes			NULL
 # 7	created_at	datetime							No			None
 # 8	updated_at	datetime							No			None
 #  ############################# Scema Information ##############################################################

  attr_accessible :description, :featured, :summary, :title, :user_id, :attachments_attributes

  has_many :attachments, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments

  validates :title, presence: true, uniqueness: true
  
end
