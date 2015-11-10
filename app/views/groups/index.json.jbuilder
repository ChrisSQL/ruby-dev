json.array!(@groups) do |group|
  json.extract! group, :id, :author_email, :note_subject, :note_details
  json.url group_url(group, format: :json)
end
