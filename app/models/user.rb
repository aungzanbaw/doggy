require 'securerandom'
class User < ApplicationRecord
  has_secure_token :auth_token
  before_create :set_auth_token

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generate_auth_token
    end

    def generate_auth_token
      Securerandom.uuid.gsub(/\-/,'')
    end
end