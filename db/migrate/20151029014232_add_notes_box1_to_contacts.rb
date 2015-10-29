class AddNotesBox1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :notes_box1, :string
  end
end
