class AddQuantityToCraft < ActiveRecord::Migration[5.2]
  def change
    add_column :crafts, :material_quantity, :integer
  end
end
