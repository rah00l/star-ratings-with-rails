class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :assignments,:dependent => :destroy
  has_many :users, :through => :assignments
end
