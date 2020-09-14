class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.integer :manufacturer_id
      t.string :bike_name
      t.string :displacement
      t.string :bike_image_id
      t.string :bike_type_name
      t.text :bike_sentence
      t.boolean :bike_status, null: false, default: true

      t.timestamps
    end
  end
end
