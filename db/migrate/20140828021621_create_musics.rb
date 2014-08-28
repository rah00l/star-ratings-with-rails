class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.text :description
      t.boolean :featured
      t.text :summary
      t.integer :user_id

      t.timestamps
    end
  end
end
