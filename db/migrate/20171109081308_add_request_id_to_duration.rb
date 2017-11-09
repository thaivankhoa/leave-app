class AddRequestIdToDuration < ActiveRecord::Migration[5.0]
  def change
    add_column :durations, :request_id, :integer
  end
end
