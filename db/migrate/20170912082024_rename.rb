class Rename < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :target_id, :image_target_id
    rename_index :images, :target_id, :image_target_id
  end
end
