class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.binary :image
      t.string :content_type
      t.string :target

      t.timestamps
    end
  end
end
