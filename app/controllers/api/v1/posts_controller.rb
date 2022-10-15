module Api
  module V1
    class Api::V1::PostsController < ApplicationController
      before_action :fetch_user, only: %i[index show]
      before_action :authorize_request
      def index
        @posts = @user ? @user.posts.includes(:comments, :user) : Post.includes(:comments, :user)
        render json: @posts
      end

      private

      def fetch_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
