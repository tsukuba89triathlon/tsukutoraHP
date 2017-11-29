class CreateReleasdInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :released_infos do |t|
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
