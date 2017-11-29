class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :full_name
      t.string :user_name
      t.string :password
      t.string :password_confirmation
      t.integer :status
      t.integer :grade
      t.string :belong
      t.string :hometown
      t.string :school
      t.string :sports
      t.string :bike
      t.string :q1
      t.string :a1
      t.string :q2
      t.string :a2
      t.string :q3
      t.string :a3
      t.string :q4
      t.string :a4
      t.string :q5
      t.string :a5
      t.string :part
      t.string :addiction
      t.string :goal
      t.string :last
      t.date :graduated_year
      t.string :remark

      t.timestamps
    end
  end
end
