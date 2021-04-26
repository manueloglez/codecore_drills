class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :drill, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
