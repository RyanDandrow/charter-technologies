class AddSsnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :ssn, :string
  end
end
