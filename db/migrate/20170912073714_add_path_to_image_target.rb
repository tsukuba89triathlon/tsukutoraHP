class AddPathToImageTarget < ActiveRecord::Migration[5.1]
  def change
    add_column :image_targets, :path, :string
  end
end
