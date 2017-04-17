class CreateMotorcycles < ActiveRecord::Migration[5.0]
  def change
    create_table :motorcycles do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :cc
      t.belongs_to :style, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
