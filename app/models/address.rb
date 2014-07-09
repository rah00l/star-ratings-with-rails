class Address < ActiveRecord::Base
   attr_accessible :name, :street_address, :landmark, :pincode, :phoneno, :country_id, :city_id, :state_id
  belongs_to :user
  belongs_to :country
  belongs_to :state
  belongs_to :city
end
