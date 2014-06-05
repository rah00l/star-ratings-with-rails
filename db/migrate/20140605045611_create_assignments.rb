class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user
      t.references :role		
      t.timestamps
    end
    add_index :assignments, [:user_id, :role_id]
    add_index :assignments, [:role_id, :user_id]
  end
end
