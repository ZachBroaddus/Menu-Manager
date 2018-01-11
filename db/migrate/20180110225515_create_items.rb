class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :category
      t.decimal :price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
