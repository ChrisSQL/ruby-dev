class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :name
      t.string :attachment
      t.integer :user_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
