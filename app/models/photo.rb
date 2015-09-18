class Photo < ActiveRecord::Base

 # #	Column		Type		Collation				Null	Default	Extra	Action
 # 1	id			int(11)								No			None	AUTO_INCREMENT	 
 # 2	name		varchar(255)	utf8_unicode_ci		Yes			NULL		 
 # 3	filename	varchar(255)	utf8_unicode_ci		Yes			NULL	
 # 4	created_at	datetime							No			None
 # 5	updated_at	datetime							No			None
 # 6	user_id		int(11)								Yes			NULL

  attr_accessible :filename, :name, :attachments_attributes

  has_many :comments, as: :commentable, :dependent => :destroy

  has_many :attachments, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments

   belongs_to :user
end
