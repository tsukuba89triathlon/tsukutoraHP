class RenameContentTypeToImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :content_type, :full_path
  end
end
