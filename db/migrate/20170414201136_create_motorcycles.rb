class CreateMotorcycles < ActiveRecord::Migration[5.0]
  def change
    create_table :motorcycles do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :cc
      t.string :style

      t.timestamps
    end
  end
end
