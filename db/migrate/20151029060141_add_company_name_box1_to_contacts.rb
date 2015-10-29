class AddCompanyNameBox1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :companyNameBox1, :string
  end
end
