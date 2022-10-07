class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @post = @user.posts
  end

  def show
    @post = Post.find(params[:id].to_i)
  end
end
