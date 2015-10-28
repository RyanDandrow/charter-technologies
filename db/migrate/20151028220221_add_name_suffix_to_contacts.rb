class AddNameSuffixToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :name_suffix, :string
  end
end
