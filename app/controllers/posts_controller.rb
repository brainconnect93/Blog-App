class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @post = Post.find(params[:id].to_i)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params[:id])
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_posts_path(@user), message: 'Post created successfully'
        else
          render :new, status: 'Error: Post not created'
        end
      end
    end
end
