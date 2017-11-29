class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :game
      t.integer :year
      t.date :date
      t.boolean :duathlon
      t.boolean :aquathlon

      t.timestamps
    end
  end
end
