class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries, :id => false do |t|
      t.string :name
      t.string :code

      t.timestamps
      t.primary_key :code
    end
  end
end
