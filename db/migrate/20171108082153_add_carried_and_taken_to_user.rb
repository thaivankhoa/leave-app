class AddCarriedAndTakenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :carried, :integer, :default => 10
    add_column :users, :taken, :integer, :default => 0
  end
end
