class AddAddressLine3Box1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line3_box1, :string
  end
end
