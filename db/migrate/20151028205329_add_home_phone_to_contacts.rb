class AddHomePhoneToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :home_phone, :string
  end
end
