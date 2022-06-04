class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false,foreign_key: true
      t.references :hot_spring, null: false, foreign_key: true
      t.timestamps
      
    end
  end
end
