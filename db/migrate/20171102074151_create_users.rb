class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :user_code
      t.integer :balance, :default => 10

      t.timestamps
    end
  end
end
