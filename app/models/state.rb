class State < ActiveRecord::Base
  attr_accessible :code, :country_id, :name
  belongs_to :country
end
