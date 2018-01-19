class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :category, null: false
      t.string :image_url, null: false, :default => "default-cat.jpg"
      t.decimal :price, precision: 12, scale: 3, null: false

      t.timestamps
    end
  end
end
