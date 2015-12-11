class AddCompanyLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_label, :string
  end
end
