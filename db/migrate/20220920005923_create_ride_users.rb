class CreateRideUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :ride_users do |t|
      t.integer :ride_id
      t.integer :user_id

      t.timestamps
    end
  end
end
