class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file	
      t.integer :attachable_id
      t.string :attachable_type	
      t.integer :user_id
      t.timestamps
    end
  end
end
