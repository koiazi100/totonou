class CreateHotSprings < ActiveRecord::Migration[6.0]
  def change
    create_table :hot_springs do |t|
      t.string :name, null: false
      t.integer :prefecture_id, null: false
      t.string :postcode, null: false
      t.
      t.timestamps
    end
  end
end
