class AddIndexTargetIdToImage < ActiveRecord::Migration[5.1]
  def change
    add_index :images, :target_id
  end
end
