class AddAdditionalAddressBox3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :additionalAddressBox3, :string
  end
end
