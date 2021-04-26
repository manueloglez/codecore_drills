class RemovePointsFromDrillgroup < ActiveRecord::Migration[6.1]
  def change
    remove_column :drillgroups, :points, :string
  end
end
