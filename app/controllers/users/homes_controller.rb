class Users::HomesController < ApplicationController

  def top
    @posts = Post.all.page(params[:page]).per(10)
    @post = Post.all
  end

  def about
  end
end
