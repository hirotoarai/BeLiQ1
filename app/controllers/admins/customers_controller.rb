class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    #@post = Post.where(:post_id )
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_top_path
  end
end
