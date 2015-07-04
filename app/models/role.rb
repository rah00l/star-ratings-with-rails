class Role < ActiveRecord::Base

  ############################# Scema Information ##############################################################
  #	# 	Column 		Type 			Collation 		Null 	Default 	Extra
  #	1 	id 			int(11) 						No 		None 	AUTO_INCREMENT
  #	2 	name 		varchar(255) 	utf8_unicode_ci Yes 	NULL
  #	3 	created_at 	datetime 						No 		None
  #	4 	updated_at 	datetime 						No 		None
  ############################# Scema Information ##############################################################

  attr_accessible :name
  has_many :assignments,:dependent => :destroy
  has_many :users, :through => :assignments
end
