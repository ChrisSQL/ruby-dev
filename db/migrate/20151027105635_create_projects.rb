class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectSubject
      t.string :projectType
      t.string :projectTitle
      t.string :projectWorth
      t.date :projectDueDate
      t.string :projectDetails
      t.string :projectEmail
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
