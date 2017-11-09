class RemoveLeaveRequestIdInDuration < ActiveRecord::Migration[5.0]
  def change
    remove_column :durations, :leave_request_id
  end
end
