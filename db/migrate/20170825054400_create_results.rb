class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.date :date
      t.references :division
      t.integer :total_rank
      t.boolean :dns
      t.boolean :dnf
      t.boolean :dsq
      t.references :member
      t.time :total_time
      t.time :s_time
      t.integer :s_rank
      t.time :b_time
      t.integer :b_rank
      t.time :split
      t.time :split_time
      t.time :r_time
      t.integer :r_rank
      t.string :remarks

      t.timestamps
    end
  end
end
