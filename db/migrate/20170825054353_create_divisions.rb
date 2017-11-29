class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.references :game
      t.string :division
      t.string :distance
      t.integer :finisher
      t.integer :finisher_of_team
      t.integer :team_rank
      t.integer :num_of_team

      t.timestamps
    end
  end
end
