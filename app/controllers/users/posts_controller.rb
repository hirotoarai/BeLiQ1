class Users::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def index
    #binding.pry
    @user = current_user
    @posts = current_user.posts.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    #binding.pry
    @post_tags = @post.tags
    @post_new = Post.new
    @post_comment = PostComment.new
    @user = User.find(@post.user_id)
    #@user_name = User.name
    @favorite = Favorite.new
    #@post_new = Post.new
    #@user = current_user
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    @post.user_id = current_user.id
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    end
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

  def search
    #@tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(10)
    #binding.pry
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end