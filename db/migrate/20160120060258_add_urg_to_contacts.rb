class AddUrgToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :urg, :boolean
  end
end
