class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
