class AddWfhDayToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wfh_day, :integer, :default => 0
  end
end
