class AddHomePhoneLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :home_phone_label, :string
  end
end
