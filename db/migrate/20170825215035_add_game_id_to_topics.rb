class AddGameIdToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :game_id, :integer
  end
end
