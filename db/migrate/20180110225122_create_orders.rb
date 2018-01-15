class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
