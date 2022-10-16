module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      before_action :authorize_request, except: :create
      def create
        user = User.find_by(Name: params[:Name])
        if user&.valid_password?(params[:password])
          token = AuthenticationTokenService.call(user.id)
          render json: { token: }, status: :created
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
