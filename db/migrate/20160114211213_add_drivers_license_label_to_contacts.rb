class AddDriversLicenseLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :drivers_license_label, :string
  end
end
