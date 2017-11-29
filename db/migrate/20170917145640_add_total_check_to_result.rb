class AddTotalCheckToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :total_check, :boolean
    add_column :results, :s_check, :boolean
    add_column :results, :b_check, :boolean
    add_column :results, :split_check, :boolean
    add_column :results, :r_check, :boolean
  end
end
