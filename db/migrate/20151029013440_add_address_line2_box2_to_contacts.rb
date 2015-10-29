class AddAddressLine2Box2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line2_box2, :string
  end
end
