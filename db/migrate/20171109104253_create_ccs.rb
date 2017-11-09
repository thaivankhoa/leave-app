class CreateCcs < ActiveRecord::Migration[5.0]
  def change
    create_table :ccs do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end