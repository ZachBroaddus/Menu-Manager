class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.string :status, null: false, :default => 'in progress'
      t.decimal :tip_multiplier, null: false, :default => 0

      t.timestamps
    end
  end
end
