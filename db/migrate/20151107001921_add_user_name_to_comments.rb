class AddUserNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_name, :string

    add_index :comments, :user_name
  end
end
