class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :comment
      t.references :user
      t.integer :score
      t.string :default
#      t.string :0

      t.timestamps
    end
    add_index :ratings, :comment_id
    add_index :ratings, :user_id
  end
end
