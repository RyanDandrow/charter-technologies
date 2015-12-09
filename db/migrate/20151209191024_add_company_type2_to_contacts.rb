class AddCompanyType2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company_type2, :string
  end
end
