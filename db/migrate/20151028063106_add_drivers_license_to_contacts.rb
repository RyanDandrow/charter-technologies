class AddDriversLicenseToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :drivers_license, :string
  end
end
