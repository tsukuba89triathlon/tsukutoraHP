class AddLinkToReleasedInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :released_infos, :link, :string
  end
end
