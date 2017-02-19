module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :authenticate, except: [:login, :index]
      protect_from_forgery with: :null_session

      def index
        render plain: "Everyone see me"
      end

      def login
        user = User.find_by(phone: params[:phone], password: params[:password])
        if user.nil?
          render json: {status: "Bad credentials"}, status: 401
        else
          if user.auth_token.nil?
            user.auth_token = SecureRandom.uuid.gsub(/\-/,'')
            user.save
          end
          render json: {status: "Authorized", token: user.auth_token}, status: 200
        end
      end

      def auth

      end

      protected
        def authenticate
          authenticate_token || render_unauthorized
        end

        def authenticate_token
          authenticate_with_http_token do |token, options|
            User.find_by(auth_token: token)
          end
        end

        def render_unauthorized
          self.headers['WWW-Authenticate'] = 'Token realm="Application"'
          render json: 'Bad credentials', status: 401
        end

        # def authenticate
        #   authenticate_or_request_with_http_token do |token, options|
        #     ActiveSupport::SecurityUtils.secure_compare(
        #       ::Digest::SHA256.hexdigest(token),
        #       ::Digest::SHA256.hexdigest(user.password)
        #     )
        #   end
        # end
    end
  end
end
