class AddNotesBox3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :notes_box3, :string
  end
end
