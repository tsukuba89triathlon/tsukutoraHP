class AddGameAnchorToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_anchor, :integer
  end
end
