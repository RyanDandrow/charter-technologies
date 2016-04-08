class RemoveUrgentFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :urgent, :string
  end
end
