class CreateComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :components do |t|
      t.string :type
      t.string :model

      t.timestamps
    end
  end
end
