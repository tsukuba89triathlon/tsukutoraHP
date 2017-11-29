class RenameTargetToImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :target, :target_id
    change_column :images, :target_id, :integer

  end
end
