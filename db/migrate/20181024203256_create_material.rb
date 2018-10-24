class CreateMaterial < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
    end
  end
end
