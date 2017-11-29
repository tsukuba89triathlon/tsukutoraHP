class AddEffectiveToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :effective, :boolean
  end
end
