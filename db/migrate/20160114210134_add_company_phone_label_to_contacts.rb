class AddCompanyPhoneLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_phone_label, :string
  end
end
