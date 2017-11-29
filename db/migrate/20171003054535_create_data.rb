class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.integer :type
      t.string :title
      t.references :member_id, foreign_key: true
      t.string :file_path

      t.timestamps
    end
  end
end
