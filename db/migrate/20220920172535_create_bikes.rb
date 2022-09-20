class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.integer :user_id
      t.string :model
      t.timestamps
    end
  end
end
