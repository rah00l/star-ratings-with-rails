class CreateStates < ActiveRecord::Migration
  def change
    create_table :states, :id => false do |t|
      t.string :name
      t.string :code
      t.integer :country_id

      t.timestamps
      t.primary_key :code
    end
  end
end
