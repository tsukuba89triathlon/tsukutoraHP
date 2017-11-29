class RenameSplitToResults < ActiveRecord::Migration[5.1]
  def change
    rename_column :results, :split, :split_rank
    change_column :results, :split_time, :integer
  end
end
