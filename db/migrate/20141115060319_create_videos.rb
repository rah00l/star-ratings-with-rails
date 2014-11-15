class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :uid
      t.string :link
      t.string :title
      t.string :author
      t.string :duration
      t.integer :likes
      t.integer :dislikes


      t.timestamps
    end
        add_index :videos, :uid, unique: true
    
  end
end
