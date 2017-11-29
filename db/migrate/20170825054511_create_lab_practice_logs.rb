class CreateLabPracticeLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_practice_logs do |t|
      t.references :member
      t.date :date
      t.float :swim
      t.float :bike
      t.float :run
      t.text :remark
      t.float :conversion_distance

      t.timestamps
    end
  end
end
