class AddIndexToImage < ActiveRecord::Migration[5.1]
  def change
    add_index :images, :member_id, name: 'index_images_on_member_id'
    add_column :images, :order, :integer
  end
end
