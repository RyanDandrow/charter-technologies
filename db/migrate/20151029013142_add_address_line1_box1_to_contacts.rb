class AddAddressLine1Box1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line1_box1, :string
  end
end
