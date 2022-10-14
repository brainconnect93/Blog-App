class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).where(user_id: params[:user_id].to_i)
    @user = current_user
  end

  def show
    @post = Post.find(params[:id].to_i)
    @user = User.find_by(id: params[:user_id].to_i)
    @comments = Comment.where(post_id: params[:id].to_i)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params[:id])
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to "/users/#{@post_new.user_id}/posts/", message: 'Post created successfully'
        else
          render :new, status: 'Error: Post not created'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
