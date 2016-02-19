class RemoveAdditionalCompaniesFromContacts < ActiveRecord::Migration
  def change
  	remove_column :contacts, :company2, :string
  	remove_column :contacts, :company_type2, :string
  	remove_column :contacts, :company3, :string
  	remove_column :contacts, :company_type3, :string
  end
end
