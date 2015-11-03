class Googleuser < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |googleuser|
      googleuser.provider = auth.provider
      googleuser.uid = auth.uid
      googleuser.name = auth.info.name
      googleuser.oauth_token = auth.credentials.token
      googleuser.oauth_expires_at = Time.at(auth.credentials.expires_at)
      googleuser.save!
    end
  end
end
