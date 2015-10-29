class AddSpouseFirstNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_first_name, :string
  end
end
