class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.string :name
      t.string :date
      t.string :location
      t.string :category
      t.string :distance
      t.string :about
      t.boolean :completed, :default => false
      
      t.timestamps
    end
  end
end
