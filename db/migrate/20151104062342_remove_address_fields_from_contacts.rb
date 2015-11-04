class RemoveAddressFieldsFromContacts < ActiveRecord::Migration
  def change
  	remove_column :contacts, :address_line1_box1, :string
  	remove_column :contacts, :address_line2_box1, :string
  	remove_column :contacts, :address_line3_box1, :string
  	remove_column :contacts, :address_line1_box2, :string
  	remove_column :contacts, :address_line2_box2, :string
  	remove_column :contacts, :address_line3_box2, :string
  	remove_column :contacts, :address_line1_box3, :string
  	remove_column :contacts, :address_line2_box3, :string
  	remove_column :contacts, :address_line3_box3, :string
  	remove_column :contacts, :address_line1_box4, :string
  	remove_column :contacts, :address_line2_box4, :string
  	remove_column :contacts, :address_line3_box4, :string
  end
end
