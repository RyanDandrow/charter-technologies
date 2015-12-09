class AddCompany3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company3, :string
  end
end
