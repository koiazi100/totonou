class CreateHotSprings < ActiveRecord::Migration[6.0]
  def change
    create_table :hot_springs do |t|
      t.string :name, null: false
      t.integer :prefecture_id, null: false
      t.string :postcode, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.text :homepage, optional: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
