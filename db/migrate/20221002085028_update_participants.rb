class UpdateParticipants < ActiveRecord::Migration[6.1]
  def up
    change_column :participants, :time, :string
    add_column :participants, :speed, :decimal, precision: 100, scale: 2
  end

  def down
    change_column :participants, :time, :integer
  end
end