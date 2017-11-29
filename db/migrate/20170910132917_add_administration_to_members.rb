class AddAdministrationToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :administration, :boolean
    add_column :members, :lab_admin, :boolean
  end
end
