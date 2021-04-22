class RemoveValueFromPoints < ActiveRecord::Migration[6.1]
  def change
    remove_column :points, :value, :integer
  end
end
