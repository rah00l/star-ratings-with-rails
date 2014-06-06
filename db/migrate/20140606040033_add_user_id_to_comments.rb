class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
    add_column :comments, :user_id, :integer
    add_column :photos, :user_id, :integer
    add_column :events, :user_id, :integer
  end
end
