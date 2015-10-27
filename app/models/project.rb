class Project < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :projectTitle, presence: true, length: { maximum: 100 }
end
