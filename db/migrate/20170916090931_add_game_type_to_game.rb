class AddGameTypeToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_type, :integer
    remove_column :games, :duathlon
    remove_column :games, :aquathlon
  end
end
