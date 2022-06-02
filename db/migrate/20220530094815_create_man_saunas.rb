class CreateManSaunas < ActiveRecord::Migration[6.0]
  def change
    create_table :man_saunas do |t|
      t.integer :hot_temperture
      t.integer :cold_temperture
      t.integer :people_count
      t.text :remarks
      t.references :hot_spring, null: false, foreign_key: true
      t.timestamps
    end
  end
end
