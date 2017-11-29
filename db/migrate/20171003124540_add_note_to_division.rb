class AddNoteToDivision < ActiveRecord::Migration[5.1]
  def change
    add_column :divisions, :note, :string
  end
end
