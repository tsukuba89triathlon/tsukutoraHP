class AddCollegeIdToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :college_id, :integer
  end
end
