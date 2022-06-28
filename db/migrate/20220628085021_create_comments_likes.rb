class CreateCommentsLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :comments_likes do |t|
      t.references :user, null: false
      t.references :comment, null: false
      t.timestamps
    end
  end
end
