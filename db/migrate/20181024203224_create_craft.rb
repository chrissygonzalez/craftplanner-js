class CreateCraft < ActiveRecord::Migration[5.2]
  def change
    create_table :crafts do |t|
      t.string :title
      t.string :description
      t.string :method
      t.string :source
    end
  end
end
