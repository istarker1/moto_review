class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :vote, null: false
      t.belongs_to :user, null: false, index: true
      t.belongs_to :review, null: false, index: true

      t.timestamps
    end
  end
end
