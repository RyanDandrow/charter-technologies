class AddCompanyPhoneToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_phone, :string
  end
end
