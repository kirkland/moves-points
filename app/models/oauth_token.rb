class OauthToken < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :user, presence: true

  def self.create_from_auth_hash(auth_hash)
    create access_token: auth_hash['credentials']['token'],
      expires_at: Time.at(auth_hash['credentials']['expires_at']),
      refresh_token: auth_hash['credentials']['refresh_token']
  end
end
