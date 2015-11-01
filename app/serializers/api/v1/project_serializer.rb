class Api::V1::MicropostSerializer < Api::V1::BaseSerializer
  attributes :id, :project_details, :project_title, :created_at, :updated_at

  has_one :user


end