require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    projects: Field::HasMany,
    timetables: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    password_digest: Field::String,
    remember_digest: Field::String,
    admin: Field::Boolean,
    activation_digest: Field::String,
    activated: Field::Boolean,
    activated_at: Field::DateTime,
    reset_digest: Field::String,
    reset_sent_at: Field::DateTime,
    authentication_token: Field::String,
    provider: Field::String,
    uid: Field::String,
    oauth_token: Field::String,
    oauth_expires_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :projects,
    :timetables,
    :id,
    :name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :projects,
    :timetables,
    :name,
    :email,
    :password_digest,
    :remember_digest,
    :admin,
    :activation_digest,
    :activated,
    :activated_at,
    :reset_digest,
    :reset_sent_at,
    :authentication_token,
    :provider,
    :uid,
    :oauth_token,
    :oauth_expires_at,
  ]
end
