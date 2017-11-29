class CreateLabSeminars < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_seminars do |t|
      t.string :title
      t.string :theme
      t.date :date
      t.string :point_1
      t.string :point_2
      t.string :point_3
      t.string :point_4
      t.string :point_5
      t.string :remark
      t.binary :document
      t.string :document_type

      t.timestamps
    end
  end
end
