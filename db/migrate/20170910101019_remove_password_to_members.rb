class RemovePasswordToMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :password
    remove_column :members, :password_confirmation
  end
end
