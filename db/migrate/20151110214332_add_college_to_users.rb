class AddCollegeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :college_name, :string
  end
end
