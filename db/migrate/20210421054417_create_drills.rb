class CreateDrills < ActiveRecord::Migration[6.1]
  def change
    create_table :drills do |t|
      t.text :description
      t.timestamps
    end
  end
end
