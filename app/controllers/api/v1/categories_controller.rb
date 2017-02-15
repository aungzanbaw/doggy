module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :authenticate, except: [:index]
      def index
        render plain: "Everyone see me"
      end

      def edit
        render plain: "I am only accessible if you know the password"
      end

      protected
        def authenticate
          authenticate_or_request_with_http_token do |token, options|
            ActiveSupport::SecurityUtils.secure_compare(
              ::Digest::SHA256.hexdigest(token),
              ::Digest::SHA256.hexdigest(TOKEN)
            )
          end
        end
      private
        TOKEN = "secret"
    end
  end
end
