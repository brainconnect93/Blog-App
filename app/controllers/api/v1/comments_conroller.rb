module Api
  module V1
    class Api::V1::CommentsController < ApplicationController
      def index
        @post = Post.find(params[:post_id])
        @comments = @post ? @post.comments.includes(:user) : Comment.includes(:user)
        render json: @comments
      end

      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user = @post.user

        render json: @comment, status: :created if @comment.save
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
