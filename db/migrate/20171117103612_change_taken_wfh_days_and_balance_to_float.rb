class ChangeTakenWfhDaysAndBalanceToFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :taken, :float, :default => 0
  	change_column :users, :wfh_day, :float, :default => 0
  	change_column :users, :balance, :float, :default => 0
  end
end
