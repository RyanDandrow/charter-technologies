class AddAddressLinesBox1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :addressLinesBox1, :text
  end
end
