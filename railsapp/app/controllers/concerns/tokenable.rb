module Tokenable
  extend ActiveSupport::Concern
  included do
    before_action :get_access_token
  end
  def get_access_token
    @access_token ||= ApiKey.first.try(:access_token)
  end
end
