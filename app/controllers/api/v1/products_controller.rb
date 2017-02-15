module Api
  module V1
    class ProductsController < ApplicationController
      # before_action :authenticate
      # before_action :set_default_reponse_format

      def index
        render json: Product.all, status: 200
      end

      protected
        def authenticate
          authenticate_or_request_with_http_token do |token, options|
            @user = User.find_by(auth_token: token)

          end
        end

        def set_default_reponse_format
          request.format :json unless params[:format]
        end
    end
  end
end

 # Sidekiq, Resque, and Delayed Job
