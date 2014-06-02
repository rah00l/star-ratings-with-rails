class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :article
      t.references :user
      t.integer :score , :default => 0
      t.timestamps
    end
    add_index :ratings, :article_id
    add_index :ratings, :user_id
  end
end
