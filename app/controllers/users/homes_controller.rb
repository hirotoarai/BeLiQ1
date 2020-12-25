class Users::HomesController < ApplicationController

  def top
    #@tag_list = Tag.all
    @posts = Post.all.page(params[:page]).per(10)
  end

  def about
  end
end
