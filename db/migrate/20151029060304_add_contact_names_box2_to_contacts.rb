class AddContactNamesBox2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :contactNamesBox2, :string
  end
end
