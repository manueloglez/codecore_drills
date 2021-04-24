class AddValueToDrillgroup < ActiveRecord::Migration[6.1]
  def change
    add_column :drillgroups, :value, :integer
  end
end
