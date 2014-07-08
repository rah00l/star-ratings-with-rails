class City < ActiveRecord::Base
  attr_accessible :code, :name, :state_id
  self.primary_key = :code
  belongs_to :state  
end
