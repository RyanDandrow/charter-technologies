class AddAddressLine3Box2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line3_box2, :string
  end
end
