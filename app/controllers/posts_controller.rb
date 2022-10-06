class PostsController < ApplicationController
  def index
    # @user = User.find(params[:user_id].to_i)
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end
end
