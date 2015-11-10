class Timetable < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.

end