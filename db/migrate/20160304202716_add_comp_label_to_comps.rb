class AddCompLabelToComps < ActiveRecord::Migration
  def change
    add_column :comps, :comp_label, :string
  end
end
