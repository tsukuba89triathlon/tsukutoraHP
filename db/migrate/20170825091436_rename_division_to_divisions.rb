class RenameDivisionToDivisions < ActiveRecord::Migration[5.1]
  def change
    rename_column :divisions, :division, :div
  end
end
