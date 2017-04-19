class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :motorcycle, null: false, index: true
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end
  end
end
