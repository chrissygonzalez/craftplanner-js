class CreateProject < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.date :start_date
      t.date :end_date
      t.integer :craft_id
      t.integer :user_id
    end
  end
end
