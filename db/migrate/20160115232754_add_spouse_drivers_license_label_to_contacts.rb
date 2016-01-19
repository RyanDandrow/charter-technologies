class AddSpouseDriversLicenseLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_drivers_license_label, :string
  end
end
