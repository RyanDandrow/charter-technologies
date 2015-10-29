class AddUrgentToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :urgent, :string
  end
end
