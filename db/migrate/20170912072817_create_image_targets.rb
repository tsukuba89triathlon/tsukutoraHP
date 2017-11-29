class CreateImageTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :image_targets do |t|
      t.string :target

      t.timestamps
    end
  end
end
