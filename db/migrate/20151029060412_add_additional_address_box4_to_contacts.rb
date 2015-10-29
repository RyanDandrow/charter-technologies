class AddAdditionalAddressBox4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :additionalAddressBox4, :string
  end
end
