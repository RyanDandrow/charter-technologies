class AddNotesBox4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :notes_box4, :string
  end
end
