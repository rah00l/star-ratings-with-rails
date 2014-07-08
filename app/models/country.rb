class Country < ActiveRecord::Base
  attr_accessible :code, :name
  self.primary_key = :code
  has_one :address
  has_many :states
end
