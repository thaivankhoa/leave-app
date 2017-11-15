class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :reviewer
      t.string :ccer
      t.string :request_type
      t.text :reason

      t.timestamps
    end
  end
end
