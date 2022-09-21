class CreateComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :components do |t|
      t.integer :bike_id
      t.string :category
      t.string :model

      t.timestamps
    end
  end
end
