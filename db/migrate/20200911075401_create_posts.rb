class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :post_title, null: false
      t.text :post_sentence, null: false
      t.string :post_image_id, null: false

      t.timestamps
    end
  end
end
