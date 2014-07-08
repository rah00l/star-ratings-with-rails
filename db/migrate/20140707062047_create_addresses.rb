class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name 
      t.text :street_address	
      t.string :landmark
      t.integer :user_id
      t.string :city_id
      t.string :state_id
      t.string :country_id
      t.string :pincode
      t.string :phoneno
      t.timestamps
    end
  end
end
