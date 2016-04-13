class AddMiddleInitialToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :middle_initial, :string
    add_column :contacts, :spouse_middle_initial, :string
  end
end
