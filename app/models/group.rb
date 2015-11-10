class Group < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :note_subject, presence: true
  validates :note_details, presence: true

end
