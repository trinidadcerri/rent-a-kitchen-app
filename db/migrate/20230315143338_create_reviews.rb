class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :raiting
      t.references :user, null: false, foreign_key: true
      t.references :kitchen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
