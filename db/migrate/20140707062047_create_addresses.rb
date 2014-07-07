class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name 
      t.text :street_address	
      t.string :landmark
      t.integer :user_id
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id
      t.string :pincode
      t.string :phoneno
      t.timestamps
    end
  end
end
