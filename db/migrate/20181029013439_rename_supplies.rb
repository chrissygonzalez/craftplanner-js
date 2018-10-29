class RenameSupplies < ActiveRecord::Migration[5.2]
  def change
    rename_table :supplies, :project_materials
    add_column :project_materials, :quantity, :integer
  end
end
