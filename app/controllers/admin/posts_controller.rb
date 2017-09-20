class Admin::PostsController < Admin::ApplicationController
  def index
   @posts = Post.all.order(:id)
 end

 def publish
   @post.toggle!(:published)
   redirect_to [:admin, :posts]
 end

 def edit
 end

 def update
   if @post.update(protected_params)
     redirect_to :posts
   else
     render 'edit'
   end
 end

 private

 def protected_params
   params.require(:post).permit(:title, :content)
 end
end
