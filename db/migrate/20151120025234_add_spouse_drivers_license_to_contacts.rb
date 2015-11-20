class AddSpouseDriversLicenseToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_drivers_license, :string
  end
end
