class RenameProjectMaterials < ActiveRecord::Migration[5.2]
  def change
    rename_table :project_materials, :craft_materials
  end
end
