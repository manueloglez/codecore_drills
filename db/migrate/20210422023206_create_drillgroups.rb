class CreateDrillgroups < ActiveRecord::Migration[6.1]
  def change
    create_table :drillgroups do |t|
      t.string :title
      t.string :description
      t.string :level
      t.string :points

      t.timestamps
    end
  end
end
