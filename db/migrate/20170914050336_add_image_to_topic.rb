class AddImageToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :image, :binary
    add_column :topics, :path, :string
  end
end
