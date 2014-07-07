class Address < ActiveRecord::Base
   attr_accessible :name, :street_address, :landmark, :pincode, :phoneno
  belongs_to :user
  belongs_to :country

end
