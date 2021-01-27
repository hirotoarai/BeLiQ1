class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_top_path
  end
end
