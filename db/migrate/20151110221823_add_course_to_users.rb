class AddCourseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :course_name, :string
  end
end
