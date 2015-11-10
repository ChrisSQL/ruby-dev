class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :author_email
      t.string :note_subject
      t.text :note_details

      t.timestamps null: false
    end
  end
end
