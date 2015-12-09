class RemoveNotesFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :notes_box1, :string
    remove_column :contacts, :notes_box2, :string
    remove_column :contacts, :notes_box3, :string
    remove_column :contacts, :notes_box4, :string
  end
end
