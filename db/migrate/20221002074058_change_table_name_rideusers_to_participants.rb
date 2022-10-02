class ChangeTableNameRideusersToParticipants < ActiveRecord::Migration[6.1]
  def change
    rename_table :ride_users, :participants
  end
end
