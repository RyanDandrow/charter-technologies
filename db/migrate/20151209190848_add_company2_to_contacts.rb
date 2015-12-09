class AddCompany2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company2, :string
  end
end
