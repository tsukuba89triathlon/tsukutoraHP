class AddMemberIdToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :member_id, :integer
  end
end
