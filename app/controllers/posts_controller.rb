class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
  end  

  def create 
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully saved!"
      redirect_to :posts
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Updated Successfully!"
      redirect_to :posts
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    flash[:notice] = "Student was destroyed"
    redirect_to :posts
  end

  private
    def post_params
      params.require(:post).permit(:headline, :body)
    end
end