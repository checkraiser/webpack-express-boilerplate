module API
  module V1
    module Defaults
      # if you're using Grape outside of Rails, you'll have to use Module#included hook
      extend ActiveSupport::Concern

      included do
        # common Grape settings
        #prefix 'api'
        version 'v1'
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        # global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        # global exception handler, used for error notifications
        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            error_response(message: "Internal server error", status: 500)
          end
        end

        # HTTP header based authentication
        before do
          error!('Unauthorized', 401) unless ApiKey.first.access_token == params['access_token']
        end

        helpers do
          def default_serializer_options
            {root: false}
          end
        end
      end
    end
  end
end
