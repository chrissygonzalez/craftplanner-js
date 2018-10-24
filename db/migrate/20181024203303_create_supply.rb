class CreateSupply < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.integer :craft_id
      t.integer :material_id
    end
  end
end
