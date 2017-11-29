class AddYomiganaToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :yomigana, :string
  end
end
