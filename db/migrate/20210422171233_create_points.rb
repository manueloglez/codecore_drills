class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.references :drillgroup, foreign_key: true
      t.integer :value
      t.float :score
      t.integer :taken, default: 0

      t.timestamps
    end
  end
end
