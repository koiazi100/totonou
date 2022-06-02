class CreateWomanSaunas < ActiveRecord::Migration[6.0]
  def change
    create_table :woman_saunas do |t|
      t.integer :w_hot_temperture
      t.integer :w_cold_temperture
      t.integer :w_people_count
      t.text :w_remarks
      t.references :hot_spring, null: false, foreign_key: true
      t.timestamps
    end
  end
end
