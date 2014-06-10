class User < ActiveRecord::Base
  # Associations
  has_many :oauth_tokens
end
