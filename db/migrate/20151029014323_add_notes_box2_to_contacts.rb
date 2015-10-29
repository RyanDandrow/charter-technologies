class AddNotesBox2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :notes_box2, :string
  end
end
