class CreateColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :colleges do |t|
      t.references :school, foreign_key: true
      t.string :college
      t.string :abbreviation

      t.timestamps
    end
  end
end
