class Users::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def index
    @posts = current_user.posts.all
  end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @user = User.find(@post.user_id)
    #@post_new = Post.new
    #@user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user != current_user
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end
