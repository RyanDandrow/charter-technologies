class AddCompanyTypeToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_type, :string
  end
end
