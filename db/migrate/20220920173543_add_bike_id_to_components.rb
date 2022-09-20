class AddBikeIdToComponents < ActiveRecord::Migration[6.1]
  def change
    add_column :components, :bike_id, :integer
  end
end
