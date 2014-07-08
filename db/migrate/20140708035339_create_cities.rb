class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities, :id => false do |t|
      t.string :name
      t.string :code
      t.string :state_id

      t.timestamps
      t.primary_key :code
    end
  end
end
