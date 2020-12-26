class Users::HomesController < ApplicationController

  def top
    @posts = Post.all.page(params[:page]).per(10)
    # @post = Post.find_by(: )
  end

  def about
  end
end
