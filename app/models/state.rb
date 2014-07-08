class State < ActiveRecord::Base
  attr_accessible :code, :country_id, :name
  self.primary_key = :code
  belongs_to :country
  has_many :cities
end
