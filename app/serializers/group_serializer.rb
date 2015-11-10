class GroupSerializer < ActiveModel::Serializer
  attributes :id, :author_email, :note_subject, :note_details
end
