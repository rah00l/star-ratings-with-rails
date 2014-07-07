class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_one :address
  has_many :states
end
