class PostsController < ApplicationController

  def index
    @posts = Post.includes(:image).published
  end

  def show
    @comment = if params[:edit_comment_id].present?
       @post.comments.find(params[:edit_comment_id])
     else
       @post.comments.new
     end
  end

  def edit
  end
end
