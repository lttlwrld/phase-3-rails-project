class AddTimeAndSpeedToRideUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :ride_users, :time, :integer
    add_column :ride_users, :speed, :integer
  end
end
