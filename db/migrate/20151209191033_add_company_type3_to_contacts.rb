class AddCompanyType3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_type3, :string
  end
end
