class CreateDurations < ActiveRecord::Migration[5.0]
  def change
    create_table :durations do |t|
      t.date :first_date
      t.date :last_date
      t.string :duration_type
      t.integer :leave_request_id

      t.timestamps
    end
  end
end
