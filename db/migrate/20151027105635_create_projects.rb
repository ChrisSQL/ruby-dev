class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_subject
      t.string :project_type
      t.string :project_title
      t.string :project_worth
      t.date :project_due_date
      t.string :project_details
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
