class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :password_digest
      t.string :role, null: false, :default => "user"

      t.timestamps
    end
  end
end
