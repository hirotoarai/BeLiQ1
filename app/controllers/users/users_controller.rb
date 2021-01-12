class Users::UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:show]

  def show
    @post_new = Post.new
    @user = User.find(params[:id])
  end

  def mypage
    @post_new = Post.new
    # @posts = Post.all.page(params[:page]).per(10)
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    #ユーザーがカレントユーザーもしくは管理者ではなかった場合、トップ画面に戻す
    if !(current_user || admin_signed_in?)
      redirect_to root_path
    end
  end

  def update
    @post_new = Post.new
    @user = User.find(params[:id])
    # byebug
    if current_user
       @user.update(user_params)
       #render :show
       redirect_to mypage_path
    elsif admin_signed_in?
      @user.update(user_params)
       redirect_to user_path
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

  def posts
    #ポストモデルからユーザーidを取得
    @posts = Post.where(user_id: params[:id])
    @post = @posts.page(params[:page]).per(10)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :profile_image)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end