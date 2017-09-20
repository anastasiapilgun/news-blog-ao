class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.new permited_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def update
    @post = Post.find params[:post_id]
    @comment = @post.comments.find params[:id]
    if @comment.update permited_params
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  protected

  def permited_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
