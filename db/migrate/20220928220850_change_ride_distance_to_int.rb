class ChangeRideDistanceToInt < ActiveRecord::Migration[6.1]
  def change
    change_table :rides do |t|
      t.change :distance, :integer
    end
  end
end
