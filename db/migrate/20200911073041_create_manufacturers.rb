class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :manufacturer_name, null: false
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
