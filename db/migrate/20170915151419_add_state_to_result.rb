class AddStateToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :state, :integer
    remove_column :results, :dns
    remove_column :results, :dnf
    remove_column :results, :dsq
  end
end
