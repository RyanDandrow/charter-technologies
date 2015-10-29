class AddAddressLine1Box2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line1_box2, :string
  end
end
