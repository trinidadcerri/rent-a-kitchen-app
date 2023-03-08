class CreateKitchens < ActiveRecord::Migration[7.0]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.integer :price
      t.string :address
      t.string :photo_url

      t.timestamps
    end
  end
end
