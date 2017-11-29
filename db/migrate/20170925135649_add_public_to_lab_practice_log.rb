class AddPublicToLabPracticeLog < ActiveRecord::Migration[5.1]
  def change
    add_column :lab_practice_logs, :public, :boolean
  end
end
