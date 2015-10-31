class Project < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :project_due_date, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :project_title, presence: true, length: { maximum: 100 }
end
