class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(
      post_id: @post.id,
      user_id: current_user.id,
      text: comment_params
    )

    @comment.save if @comment.valid?
    redirect_to user_post_path(current_user, @post.id)
  end
end

def comment_params
  params.require(:comment).permit(:text)[:text]
end
private :comment_params
