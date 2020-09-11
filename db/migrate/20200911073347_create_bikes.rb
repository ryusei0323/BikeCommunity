class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.integer :manufacturer_id, null: false
      t.string :bike_name, null: false
      t.string :displacement, null: false
      t.string :bike_image_id, null: false
      t.string :bike_type_name, null: false
      t.text :bike_sentence, null: false
      t.boolean :bike_status, null: false, default: true

      t.timestamps
    end
  end
end
