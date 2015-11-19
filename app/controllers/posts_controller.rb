class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post saved!"
      redirect_to @post
    else
      flash[:error] = "There was an issue saving your post, please try again!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

   def update
     @post = Post.find(params[:id])
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post updated!"
       redirect_to @post
     else
       flash[:error] = "There was an issue saving your post, please try again!"
       render :edit
     end
   end

end
