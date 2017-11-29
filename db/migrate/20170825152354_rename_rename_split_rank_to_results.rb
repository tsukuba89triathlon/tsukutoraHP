class RenameRenameSplitRankToResults < ActiveRecord::Migration[5.1]
  def change
    rename_column :results, :split_rank, :split
    rename_column :results, :split_time, :split_rank
  end
end
