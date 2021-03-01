class Users::PostsController < ApplicationController

  def index
    @user = current_user
    @posts = @user.posts.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    #投稿に関連するタグの取得
    @post_tags = @post.tags
    @post_new = Post.new
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.page(params[:page]).per(5)
    @user = User.find(@post.user_id)
    @favorite = Favorite.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    @post.user_id = current_user.id
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      flash[:notice] = 'タイトルは４０字以内、本文は１,０００文字以内です。'
      redirect_to mypage_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(" ")
    @user = User.find(@post.user_id)
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(10)
    #binding.pry
  end

  def followings
    @user = User.find(params[:id])
    render 'show_followings'
  end

  def followers
    @user = User.find(params[:id])
    render 'show_followers'
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category)
  end
end