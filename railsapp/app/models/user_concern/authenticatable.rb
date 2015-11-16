module UserConcern
  module Authenticatable
    include ActiveSupport::Concern
    def authenticate(password)
      self.valid_password?(password)
    end
  end
end
