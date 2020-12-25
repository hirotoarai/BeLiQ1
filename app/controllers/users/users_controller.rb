class Users::UsersController < ApplicationController
  #before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:show]

  def show
    @post_new = Post.new
    @user = User.find(params[:id])
    #@post = Post.find(params[:id])
  end

  def mypage
    @post_new = Post.new
    @posts = Post.all.page(params[:page]).per(10)
    @user = current_user
    #@post = Post.find(params[:id])
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.save
  #     redirect_to posts_path
  # end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to edit_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    #@user = User.find_by(name: params[:name])
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :profile_image)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end