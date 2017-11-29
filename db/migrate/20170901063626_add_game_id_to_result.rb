class AddGameIdToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :game_id, :integer
  end
end
