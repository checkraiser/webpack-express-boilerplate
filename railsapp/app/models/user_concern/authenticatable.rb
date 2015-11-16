module UserConcern
  module Authenticatable
    extend ActiveSupport::Concern
    def authenticate(password)
      self.valid_password?(password)
    end
  end
end
